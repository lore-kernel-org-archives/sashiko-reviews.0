Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63E3DB30C;
	Tue, 19 May 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211060; cv=none; b=LQm3JQZiqe2kBt6ekBZV5DxpRNmjehrI5XGXPjtC8S59JZ/TYerw4DxRy3j/LCFpJxaPIOx1GXE6ADsfdNxbNJwF9DhPJ2YEHG7zPuOhLHCCqNKzDYZmFeGJ8fYkzi2VW3HNMcpLb9QSRb2ZYEO251uXoplVe7z41P23443ps2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211060; c=relaxed/simple;
	bh=wASe8AAF6eqB7WwYUuPGtNWG3HLiAbXhwp3iwMlE0Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnePV1SQb7XGGZCjQkdlvBvqPv2FdWJjTdAtyBvuXIf2Pr9hn9ttGfcTb9+cnm9XZJNp3dnbQgqnAhmjm5uM3nWUnotT5kefZQqFdTBNpvoLjvBQBZyU0CDfaKrMFWZrSQoAaT1yi3AtFVSf/WxjsyKssEw2wEqfpE6/xWqSvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSXkSoUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSXkSoUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96002C2BCC6;
	Tue, 19 May 2026 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211059;
	bh=wASe8AAF6eqB7WwYUuPGtNWG3HLiAbXhwp3iwMlE0Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSXkSoUaw+zwTJXhN6Xro+NKzYFDYzMXbCRh3JgIfqILgfW8BmzO7yUzeSqTan3ie
	 86fMRY4afe7EpswOvpryxoDIsHM1gliSH7Np0wvJAJBvHFY2e/+iDOY3I9lz1Vv/Lk
	 rw3njoqLcq9rknX9pwIQE9mmHfETkuZdm2HcJDRCxdKGoVFTcivcWv1iQUb6zW2iHR
	 IF8tgGPtb/srY5iaBU/mccp/vswNlWhikOJ8MSANBcNUm5wg1Y7OtRYeOQQkf1k4fT
	 Qxm9Jk+QRPwD9c4kqs15feEgSMMUdHQbqRg+3U66bZitHBxNVpCCECGUt50HtxcfEA
	 fwjZoKUSa/YKA==
Date: Tue, 19 May 2026 18:17:36 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jianhua Lin <jianhua.lin@mediatek.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <20260519-handshake-blanching-46001b94fa41@spud>
References: <20260519021726.19137-3-jianhua.lin@mediatek.com>
 <20260519023551.B50ECC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="37tIGJDtDHdsBqyt"
Content-Disposition: inline
In-Reply-To: <20260519023551.B50ECC2BCB7@smtp.kernel.org>


--37tIGJDtDHdsBqyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:35:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The commit silently introduces a new `mediatek,larb` property =
and makes it mandatory for the MT8189 variant without any mention in the co=
mmit message.
> - [Low] The new compatible string `mediatek,mt8189-jpgenc` is defined usi=
ng an `enum` containing a single item instead of `const`.
> --
>=20
> commit de42f55ad078326b54b85cf561d120b901b074be
> Author: Jianhua Lin <jianhua.lin@mediatek.com>
>=20
> dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
>=20
> This commit adds the compatible string for the JPEG encoder block found
> in the MediaTek MT8189 SoC. It is added as a standalone compatible string
> without falling back to the generic identifier to ensure proper 34-bit IO=
VA
> address space support.
>=20
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.ya=
ml
> > index 5b15f8977f67f..f75871e72633b 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> > @@ -14,13 +14,17 @@ description: |-
> > =20
> >  properties:
> >    compatible:
> > -    items:
> > +    oneOf:
> >        - enum:
> > -          - mediatek,mt2701-jpgenc
> > -          - mediatek,mt8183-jpgenc
> > -          - mediatek,mt8186-jpgenc
> > -          - mediatek,mt8188-jpgenc
> > -      - const: mediatek,mtk-jpgenc
> > +          - mediatek,mt8189-jpgenc
>=20
> This isn't a bug, but dt_binding_check usually warns about using an enum =
with
> a single item. Should this use const instead?

No it doesn't. Also "This isn't a bug, but it is a bug" is how this
sentence reads, makes no sense.

It should only be a const if there's not likely to be other devices
joining the enum.

>=20
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt2701-jpgenc
> > +              - mediatek,mt8183-jpgenc
> > +              - mediatek,mt8186-jpgenc
> > +              - mediatek,mt8188-jpgenc
> > +          - const: mediatek,mtk-jpgenc
> > +
>=20
> [ ... ]
>=20
> > @@ -45,6 +49,10 @@ properties:
> >        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for =
details.
> >        Ports are according to the HW.
> > =20
> > +  mediatek,larb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: A phandle to the smi_larb node.
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -54,6 +62,16 @@ required:
> >    - power-domains
> >    - iommus
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8189-jpgenc
> > +    then:
> > +      required:
> > +        - mediatek,larb
>=20
> The commit message mentions the standalone compatible string is needed for
> 34-bit IOVA address space support, but it doesn't mention adding the new
> mediatek,larb property or making it mandatory for the MT8189 variant.
>=20
> Could the commit message be updated to explain the purpose and necessity =
of
> this new hardware constraint?

Yes.

--37tIGJDtDHdsBqyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagybMAAKCRB4tDGHoIJi
0iPGAPi9e7DUOOOi0nCgG8BiGowUr5y5hn17Zn7//tpbphXfAQDjsdNH5I3wXOrg
tf/TgofBB9ZPi9LS1KASQ7BymoiYDA==
=4go5
-----END PGP SIGNATURE-----

--37tIGJDtDHdsBqyt--
