#[macro_use]
extern crate lando;

use lando::{LambdaContext, Request, RequestExt, Result, IntoResponse};

// see https://docs.rs/lando docs for more examples and information
#[lando]
fn handler(request: Request, _: LambdaContext) -> Result<impl IntoResponse> {
    // Return a 200 plain/text response with a "hello xxx body"
    // where xxx is a path parameter `name` in /hello/{name} uris or "stranger"
    // if not routed to with a {name} path parameter
    Ok(format!(
        "hello {}",
        request
            .path_parameters()
            .get("name")
            .unwrap_or_else(|| "stranger")
    ))
}
