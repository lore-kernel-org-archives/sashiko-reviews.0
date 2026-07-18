Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785C34EF0E
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375524; cv=none; b=A+BGGQlOFyBwZQ5/OiXbjjsOgsHJriz+70aOeP9lxAuKD7/CNwL6OFG3NO7XGW4ozbfQOVUY/VOQEpuxVpYpsJmyAinGFyF6zKeJO5ZEufUszLE/8AbIJoN3Z4kTxdH8dPYEcCVHwUWmSXmRvwUrefslJeZoPNzVruAzYvdd1v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375524; c=relaxed/simple;
	bh=3BKvuoLna1nKJyNGw4kMLw0wivdtB2XCVyn1FStQocY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pVpRmDTE4kLaUOjpYao6Zr2smqu/8qbWT+Tgap6kmPwM19gAWXBzeHbAu1SJp5+tkS6ItUhxpZeCuIvTfhsfpbtNZ/TbLWgJ9sOFW3QM9W3rj2nHHz58PxmKM1iu0nZskUPmYpqEUI7EyB7xUFEqREm4wnGdhLe77KN9b55EWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Ko9GfJ+W; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Ko9GfJ+W"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4837B240027
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 13:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1784375519;
	bh=4qH+iKLr193cZCGI6LCKp71Db0dF7o7zMoNy6fgbDrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=Ko9GfJ+W5BjqT39NNzwIXAaeAjy4R19aX8NFsUldjbyYE2OrwoCYOKdag5U6zM6gQ
	 wYTLpDl8wn8Iwo48CLuop8+4u/OWvkGzMKLM1b0uNKuzRSgujcpXoCu5B60SjXTJMB
	 JdJ5GMZssD2bJKkQY1HnbuZpYNJB841ePo1JFYk3w7GoqPKeW0LQLKFxqTBv9n8DzB
	 BScUnMHo8WTxUr8u+gkLCWOV60ldTtRinH/r2hfqaLBEb7b2zZscnm9Zz+1L9fqXni
	 KrCYT/heYX4I5/HsK0E/msUpm72fxfOa/l/gaN/CsDK0C3WCZKrYcYxPfdEtmJCw4G
	 0CVpjSPzAOP0g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4h2Q9p55CVz9rxP;
	Sat, 18 Jul 2026 13:51:58 +0200 (CEST)
Message-ID: <ca990170ca95c0c513c8ed114faf96bebaca9add.camel@posteo.de>
Subject: Re: [PATCH 3/4] rust: serdev: document `PrivateData::active`
From: Markus Probst <markus.probst@posteo.de>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Date: Sat, 18 Jul 2026 11:51:59 +0000
In-Reply-To: <20260718114652.4C1DD1F000E9@smtp.kernel.org>
References: <20260718-rust_serdev_fixes-v1-0-35433b6dce0f@posteo.de>
	 <20260718-rust_serdev_fixes-v1-3-35433b6dce0f@posteo.de>
	 <20260718114652.4C1DD1F000E9@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-00en9WidJ4JdiapFaOMD"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-00en9WidJ4JdiapFaOMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-18 at 11:46 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>=20
> New issues:
> - [Low] Documentation incorrectly references a non-existent trait method =
`Driver::receive_buf`.
> - [Low] Intra-doc link from a public struct to a private associated item.
> - [Low] Documentation uses the non-standard term 'receival'.
>=20
> Pre-existing issues:
> - [High] Use-After-Free and NULL pointer dereference in `receive_buf_call=
back` during device probe failure.
> --
>=20
> --- Patch [3]: [PATCH 3/4] rust: serdev: document `PrivateData::active` -=
--
> commit d30c5d18f4ae9af1ec1875509c50169875963fd4
> Author: Markus Probst <markus.probst@posteo.de>
> rust: serdev: document PrivateData::active
>=20
> This commit adds documentation comments for the active mutex in PrivateDa=
ta,
> explaining its purpose in blocking data reception during probe and drop.
>=20
> Link: https://lore.kernel.org/rust-for-linux/DK0SX3P5K1J6.1OV4ETJMXW83R@g=
aryguo.net/
>=20
> > diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
> > index 79d61c6ceeecd..3556fe066ace8 100644
> > --- a/rust/kernel/serdev.rs
> > +++ b/rust/kernel/serdev.rs
> > @@ -132,6 +132,23 @@ pub struct PrivateData<'bound, T: Driver> {
> >      #[pin]
> >      driver: UnsafeCell<MaybeUninit<T::Data<'bound>>>,
> >      open: UnsafeCell<bool>,
> > +    /// Whether `receive_buf_callback` is allowed to call `Driver::rec=
eive_buf`.
>=20
> [Severity: Low]
> Is the reference to Driver::receive_buf correct here? The Driver trait
> seems to implement a method named receive rather than receive_buf.
True.

>=20
> > +    ///
> > +    /// If locked, the receive_buf_callback will be blocked on data re=
ceival.
>=20
> [Severity: Low]
> This isn't a bug, but should "receival" be replaced with "reception"?
Shouldn't matter that much, but might be a better fit.

>=20
> > +    /// This is the case while the driver is being probed or while [`P=
rivateData`] is being dropped.
> > +    /// This is necessary, because we need to open the serdev device b=
efore the driver has been
> > +    /// probed in order to allow it to be configured, which allows [`A=
dapter::receive_buf_callback`]
>=20
> [Severity: Low]
> Can this intra-doc link cause build warnings under -Dwarnings?
> Adapter::receive_buf_callback appears to be an implicitly private functio=
n.
There is no clippy warning at least.

>=20
> > +    /// to be called. Thus we need to block data until probe completes=
 and the driver data becomes
> > +    /// initialized.
> > +    ///
> > +    /// If unlocked and true, the receive_buf_callback will forward th=
e data to
> > +    /// `Driver::receive_buf`. This is the normal state of operation.
> > +    ///
> > +    /// If unlocked and false, the receive_buf_callback will throw awa=
y the data.
> > +    /// This is only the case, if the serdev device is open and
> > +    /// - the driver returned an error in probe
>=20
> [Severity: High]
> This is a pre-existing issue, but could this sequence lead to a use-after=
-free
> or a null pointer dereference if T::probe fails?
>=20
> If T::probe fails, the probe_callback executes the ScopeGuard cleanup,
> which calls drvdata_obtain and frees the PrivateData allocation:
>=20
> rust/kernel/serdev.rs:probe_callback() {
>     ...
>     let private_data =3D ScopeGuard::new_with_data(private_data, |_| {
>         drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>(=
) });
>     });
>     // ...
>     to_result(unsafe { bindings::serdev_device_open(sdev.as_raw()) })?;
>     // ...
>     let data =3D T::probe(sdev, info);
>     // ...
> }
>=20
> However, serdev_device_close is only called inside the Drop implementatio=
n
> of PrivateData:
>=20
> rust/kernel/serdev.rs:PrivateData::drop() {
>     ...
>     if unsafe { *self.open.get() } {
>         unsafe { bindings::serdev_device_close(self.sdev.as_raw()) };
>     }
> }
>=20
> Because this close happens after the drvdata pointer is cleared, the C
> serdev subsystem could asynchronously invoke receive_buf_callback while
> the memory is being destroyed.
>=20
> Would receive_buf_callback then fetch a null pointer from drvdata_borrow,
> or access the Mutex memory after PrivateData is freed if it was already
> waiting on the active Mutex?

No, because active is set to false. Then serdev_device_close is called
which should synchronize the receive_buf_callback.

>=20
> rust/kernel/serdev.rs:receive_buf_callback() {
>     ...
>     let private_data =3D unsafe { sdev.as_ref().drvdata_borrow::<PrivateD=
ata<'_, T>>() };
>     let active =3D private_data.active.lock();
>     ...
> }
>=20
> > +    /// or
> > +    /// - the driver data already has been dropped, because it was unb=
ound.
> >      #[pin]
> >      active: Mutex<bool>,
> >  }

--=-00en9WidJ4JdiapFaOMD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpbaN4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSLWoQAKzYDZgnfwf1W9Xdgo9u
rl0gqyrMWgQh5iW6rsV6+7G5bG2E0RTNy8p+E7+IyqbmlxRkS/tO0kvTz2xj7xTm
ezUdcF9DbK44jjWInbsv1hxkqCfKtC9oWGZ5FxAAwNNxiy5nMNxloe14yozbV+IW
n0QLBsmcp01PR+rQiqCUWkQu1IpPSZnXdkIUqy08VzdVC6LD7raniSsm3sEF9sh+
xE/YkXCzQf+Bpoa2o9YTtpVipXJTsa7tEjOB723RD+XHo+quycJTdDU7BjCuUh/P
+bZ4Jbto5cI4NYKsRmXAmagHVzyxIU1jGmz2O4AZG0nhQAPQY+pjVjkHUN9qEnmm
zPup3o6hutJ8HQcTAvL6AwYCCH1yVf/enpxyFQ6RqmO9qgecSkNOZAa+neZVqfzd
kplwnczTLbB5sS+H7rt31b7goM0zFfsJMVMzXumCMNdGUnBB66yMudPwHg+p1WoV
EIbM9/cQkeUFf0hyFvZa7CLmhcQ9yAYWkQ4iFCQCG/onHzLnUqORCGaD2VsUpg+o
Zboz8U+ZVgfGGoX5xuZzKLpRN0FnZrJndcQB3O5XPJCYVQg1dZ6XuhlWBAZ8V8+c
BD4WIlDKmJIiZjDTnmoJDoJPbXyyojGsb+f1evALidWBOWp4FcUNtoQZyfdpgIDB
W9Df/eNhD19c4nfSmn0b8+nH
=9nix
-----END PGP SIGNATURE-----

--=-00en9WidJ4JdiapFaOMD--
