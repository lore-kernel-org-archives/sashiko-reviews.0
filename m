Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC83D9041
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368823; cv=none; b=dzJ22oKXlWgFYdV+lmlneWw8eadclePp3gkB7I3jjOUmaHVDVW4SqZDfkivumw8Os08e8kFAF3yRzEUia2RkMyi67XorgjYhvVRVS61g+wop1FlKk/RMKfk/yJ+CTfsTITePdjQIXPTgrD4T6oh1ISsASt8+WgdScElsnSuFWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368823; c=relaxed/simple;
	bh=iL7+aVGLvzEsqkiwYezshrb4BL0XF8IKjGXwqvngx6k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lTeUnZ8E3IxuLmks8Pc+Q+Dwrcy7DN9hgxa+o6PfNRv0KcCckXv4WkLwpEZexqyo5AqeN63b/NdE31UffBrxV3lQCB0UhrjIwSTjNEWm4Lmy61Xv8bn2r8FIXoU0fJbl63PLBEYHxRnE1BXTzaTNGMalFF05UI+oNq5IBzHhjys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9DSJC4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9DSJC4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4201F000E9;
	Thu, 21 May 2026 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368821;
	bh=nF+SyD7nRLQizcgTMztXBN3Q7UMNgTSioZOfH7Z8E1M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C9DSJC4kAjr9o7bHyybZ4MgxmH2SQ/10poNF+b8ozXGziuBye6Hk5WWKVctRXvw0r
	 vS2o2q6URu1l1iNmCJfheMA9ayzQ+a8yyPF+dQvcVIPnpCZTXRQ6Vsw1SAY7RT8J8A
	 cHDdLpmdeI2F15C1Y8PyKmspi8DTx6FjrPZjLw+OnpbR14phsbHmumZ5isUS5KoFOJ
	 gAu9SHm7vxKy8eu4im4NwEg+2WwJUyWpxnGSGE498n3FOnL6FgWGkoW2QObU0okSOr
	 Ioibc1ZKWmvUe+iZZh2pcUcWHaKSXa8w8pr5b5+NQUFrGw5thY7u8AoID9acxdB7yJ
	 E1uxa9aQpE8fg==
Message-ID: <f68e7ae9e2c868990030f5ec94524983dfacb5fd.camel@kernel.org>
Subject: Re: [PATCH] nfsd: fix dead ACL conflict guard in nfsd4_create
From: Jeff Layton <jlayton@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Chuck Lever <cel@kernel.org>, Anna Schumaker <anna@kernel.org>
Date: Thu, 21 May 2026 09:06:58 -0400
In-Reply-To: <20260521124251.6C13E1F000E9@smtp.kernel.org>
References: 
	<20260521-nfsd4_create_acl_posix_acl_overwrite_leak-v1-1-850fc0a7157e@kernel.org>
	 <20260521124251.6C13E1F000E9@smtp.kernel.org>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-05-21 at 12:42 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The return value of `nfsd4_acl_to_attr()` is ignored in both `nf=
sd4_create()` and `do_open_lookup()`, causing files to be silently created =
without the requested ACLs when conversion fails.
> - [High] POSIX ACLs allocated during XDR decode for `OP_CREATE`, `OP_OPEN=
`, and `OP_SETATTR` will permanently leak if the operation is aborted befor=
e execution or if a previous operation in the compound fails.
> - [High] Missing bounds check on the client-supplied `count` in `nfsd4_de=
code_posixacl()` allows unprivileged clients to trigger massive memory allo=
cations and page allocation warnings.
> --
>=20
> commit 626991554786706615df7c52291b5b951e9ebae8
> Author: Jeff Layton <jlayton@kernel.org>
>=20
> nfsd: fix dead ACL conflict guard in nfsd4_create
>=20
> This commit fixes a bug in nfsd4_create where the conflict guard tests
> already-nilled source pointers, causing it to be permanently dead code. B=
y
> checking the stolen values in attrs instead, it prevents leaking posix_ac=
l
> slab objects when multiple acl attributes are present.
>=20
> > diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
> > index ab39ec8854405..71bb2489e5a65 100644
> > --- a/fs/nfsd/nfs4proc.c
> > +++ b/fs/nfsd/nfs4proc.c
> > @@ -837,7 +837,7 @@ nfsd4_create(struct svc_rqst *rqstp, struct nfsd4_c=
ompound_state *cstate,
> > =C2=A0=C2=A0		goto out_aftermask;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (create->cr_acl) {
> > -		if (create->cr_dpacl || create->cr_pacl) {
> > +		if (attrs.na_dpacl || attrs.na_pacl) {
> > =C2=A0=C2=A0			status =3D nfserr_inval;
> > =C2=A0=C2=A0			goto out_aftermask;
> > =C2=A0=C2=A0		}
>=20
> [Severity: High]
> This is a pre-existing issue, but does the return value of nfsd4_acl_to_a=
ttr()
> get silently ignored right after this block?
>=20
> Just below this hunk in nfsd4_create(), status is assigned the return val=
ue
> of nfsd4_acl_to_attr(), but it does not appear to be checked before being
> overwritten in the subsequent switch statement:
>=20
> 	status =3D nfsd4_acl_to_attr(create->cr_type, create->cr_acl,
> 							&attrs);
> }
> current->fs->umask =3D create->cr_umask;
> switch (create->cr_type) {
>=20
> If acl conversion fails due to unsupported access control entries or ID
> mapping errors, does the server silently ignore the error, create the fil=
e
> with default permissions, and incorrectly return success to the client?
>=20
> This same pattern appears to be present in do_open_lookup() as well.
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a risk of memory
> exhaustion related to posix acl allocations for operations like op_create=
?
>=20
> If posix acls are allocated using posix_acl_alloc() during xdr decoding
> instead of using svcxdr_tmpalloc(), and operations like op_create lack an
> .op_release callback in the nfsd4_procedures array, what happens if the
> compound fails early before execution?
>=20
> For example, if a client sends a compound designed to fail early (like
> op_putfh(bad_fh) followed by op_create), do the pre-decoded acls get
> permanently leaked?
>=20
> [Severity: High]
> This is also a pre-existing issue, but does nfsd4_decode_posixacl() lack
> bounds checking on the client-supplied count?
>=20
> If the xdr decoder reads a 32-bit count and passes it directly to
> posix_acl_alloc() without checking it against the remaining xdr stream le=
ngth,
> could an unprivileged client supply an artificially large count to trigge=
r
> massive memory allocations and page allocation warnings?
>=20
> Furthermore, if the subsequent decode loop fails (because the packet actu=
ally
> lacks the access control entries), does nfsd4_decode_posixacl() return th=
e
> error without freeing the freshly allocated acl, leading to a memory leak=
 on
> malformed requests?
>=20
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-nfsd4_cr=
eate_acl_posix_acl_overwrite_leak-v1-1-850fc0a7157e@kernel.org?part=3D1

FWIW, these bugs have already been caught are being tracked, but they
are lower on the list.
--=20
Jeff Layton <jlayton@kernel.org>
