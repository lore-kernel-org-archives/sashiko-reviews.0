Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693318;
	b=eFMLYXtpvAipRrUAQ2d5Yd9hR4uA6woKlozc4DrnmzqoiZEKU4rjaIBs5Q1sfc6mfVD0
	 AIIlz9PLG1pM4i8YDO+iN7YbZKBSdiJ5D3aKiN+FCFisrk+ihA7Ybz/N7DzeDDxDXdEVD
	 uHyAvPSzYWK8hgj6BSLNNvMQZNtB9a7EqH8pqjryQTszpPdkyJ7DNyAekZ938r2MCeKLw
	 DHxAkCPXSOX5D/kvmbe5sRp5sO7QBakp3zI5FMuB9YOiebxnHHqQhXDx4kzpQhCA5TSw/
	 69sdyLVUqBun6CbIvH7FcgSTHFrWovocf+D9Ulh2EX/ZTs0XF2ZzkeyxhQqLt3Vdz2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693318;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=bYOZXiRGQJ//pWe9YOwqcOqL/wYtfhgkT4Sub0noruk=;
	b=isk9NpqXI/klVc7PlwGvleWu7kDgNwV551uYWRaU1hTzPGzqGnWkjaYiiKmQ0cJHq+SK
	 Qrp3oTL7d2ujYofrScYR8xrto8KeBJd60/BFgq7Yhm3vs00AgM9TOismXmCJbRJdlGCXW
	 b4ERfvcVSeSEvntQP96QLZQoG8nL246FopLc9YnQMyTeF2cjSNPZ57/dCwBE1PYR4pzvf
	 ssvu2E3X20HYWmHY8BrwKPK6CbWQDWd6JyoHj7D6OwattvR1sNv3YjJF/Y8vkg6shCTHd
	 +AcaXVeinDmDwufrRMb1MQS7YXom1gvuY5Ef92mMORmZFgItAVgd5wn6N+spKKcLVkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=g6WYF7CH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B78606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 11:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B78606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=g6WYF7CH
ARC-Seal: i=1; a=rsa-sha256; t=1795693309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kAgvait2QaHddMGU2JggKhLXJQ9oKhpVPIRi9m+BlZv1rYVb61KIs9WJeQCA+gdTfkUXu50+Qa5XrwxaLwBYjWpGFXRVKFbPOdFqhWbsC1Qq81DBqI6OjSgOfOhciUEQbyUn/iF3Ogr/p6F8VNR8gRP0foBbSWaWHq3MgF5k+Tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795693309; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bYOZXiRGQJ//pWe9YOwqcOqL/wYtfhgkT4Sub0noruk=; 
	b=cly2D7MXbquKLzM2AIoHxT3s4BZLanfJhKFfddNsE4X1l9kbLEQeHabFBegnfuTjf+DsVQom3Tazrfh6GSKu7fo8iwqt1GZvdv1Hu/USV5JvRDouC+r0DUfUjjmzPlJcUkatnTzseBuX7xEY8tdv8q+Iy3u4su0V+0E2c7pg2ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=g6WYF7CHxvXCwO/X7PmAgEcbCytTnyJDkKKHdY3kGmv9/+sBiwGKC8YDUhYu7qsJnpgR5bIYTjpRHoUO9l2oEo4llX8y7YPFmF0v3lDO3Ck/jwO4QnkVcZuQYwnn2lTG9NZp1Kq4K83CVPUK5WFBLJWdinv1ocNS8BgVTWfdVvw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=bYOZXiRGQJ//pWe9YOwqcOqL/wYtfhgkT4Sub0noruk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795693307754664.1898182605632;
	Thu, 26 Nov 2026 03:41:47 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 90BDB18040B; Thu, 26 Nov 2026 12:41:44 +0100 (CET)
Date: Thu, 26 Nov 2026 12:41:44 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMS81?= =?utf-8?Q?=5D?=
 dt-bindings: display: add CIX Sky1 DisplayPort transmitter
Message-ID: <awgYIdprQg1-hjfJ@venus>
References: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
 <20261126060003.3979478-2-Luo.Liu@cixtech.com>
 <sashiko-outbox-234829@kernel.org>
 <TYZPR06MB6915D02AE69A9A5649146D31F5422@TYZPR06MB6915.apcprd06.prod.outlook.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apc47prpiboe3afh"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB6915D02AE69A9A5649146D31F5422@TYZPR06MB6915.apcprd06.prod.outlook.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.675.79
X-ZohoMailClient: External


--apc47prpiboe3afh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMS81?= =?utf-8?Q?=5D?=
 dt-bindings: display: add CIX Sky1 DisplayPort transmitter
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 06:27:31AM +0000, Luo Liu wrote:
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: sashiko-bot@kernel.org <sashiko-bot@kernel=
=2Eorg>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B411=E6=9C=8826=E6=97=
=A5 14:13
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Luo Liu <Luo.Liu@cixtech.com>
> > =E6=8A=84=E9=80=81: dri-devel@lists.freedesktop.org; devicetree@vger.ke=
rnel.org;
> > robh@kernel.org; conor+dt@kernel.org
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v5 1/5] dt-bindings: display: add CIX Sk=
y1 DisplayPort
> > transmitter
> >
> > EXTERNAL EMAIL
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue to
> > consider:
> > - [Medium] dt-bindings: display: cix,sky1-dp: missing ports/port@1 and
> >   aux-bus in schema
> > --
> >
> > commit 0fd2cf4952ac57efa52ecd81791109f84491673b
> > Author: Luo Liu <Luo.Liu@cixtech.com>
> >
> > dt-bindings: display: add CIX Sky1 DisplayPort transmitter
> >
> > This commit adds the Device Tree binding schema for the Trilinear Displ=
ayPort
> > transmitter integrated on CIX Sky1.
> >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> > > b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> > > new file mode 100644
> > > index 0000000000000..2cb4dbb8d5fe5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> > > @@ -0,0 +1,102 @@
> >
> > [ ... ]
> >
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    description:
> > > +      Video input from the Mali D71 display pipeline (Komeda) that d=
rives
> > > +      this controller. The link to the sink is through phys (USB-C c=
ombo PHY
> > > +      or the native DP PHY), not a second OF graph port on the DPTX.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - resets
> > > +  - phys
> > > +  - port
> > > +
> > > +additionalProperties: false
> >
> > [Severity: Medium]
> > Should this schema define a ports container with port@0 (input) and
> > port@1 (output), as well as an optional aux-bus property for eDP panels=
, instead
> > of requiring a single unnumbered top-level port node?
> >
> > The phys property only references the local SoC PHY provider and does n=
ot
> > describe downstream sink or AUX bus topology.  In addition, an output p=
ort
> > cannot be added as an optional property later while a top-level unnumbe=
red
> > port node is required: of_graph_get_port_by_id() scopes port lookup exc=
lusively
> > to a ports child node whenever one is present, so a board DTS adding
> > ports/port@1 would hide an SoC DTSI top-level port node unless the bind=
ing is
> > migrated from port to ports.
> >
>=20
>=20
> Hi,
>=20
> This device has exactly one OF graph port: its video input, which is
> linked from the Komeda display pipeline. The DP link itself is not an OF
> graph connection. The output goes through the generic PHY referenced by
> "phys" to a physical connector on the board, and that connector is created
> by drm_bridge_connector_init() from the bridge operations. There is no
> downstream sink node, so a port@1 would have no remote-endpoint to point
> at and could only be left dangling.

You want a downstream port too, so that you can describe the
connection to the actual connector in DT (e.g. "dp-connector", but
could also be "usb-c-connector" (in that case possibly via some mux)
or even a dp2hdmi bridge followed by an hdmi connector). I suggest
to even make it mandatory as it forces people to write proper DTs.

> The schema therefore follows the usual convention of a single unnumbered
> "port" when the device has exactly one port.
>=20
> You are right that of_graph_get_port_by_id() switches to a "ports" child
> and would then no longer see a top-level "port". But no board DTS can
> legitimately add an output port here, because there is no node to connect
> it to, so that situation cannot arise for this binding. A future variant
> that does model a downstream node would come with an updated schema, and
> its DTS users would be converted at the same time.

Your DT is just incomplete if there is nothing you are connecting it
to.

> "aux-bus" is specific to eDP panels that sit as a child of the AUX
> channel. This binding covers both the USB-C DP and the native DP output
> and does not bind any panel, so the property would describe hardware that
> no code drives. It can be added as an optional property later if an eDP
> panel node is ever needed; the input port stays where it is either way, so
> that part is not blocked on the choice of "port" versus "ports".

For USB-C having the usb-c-connector link described properly might
even be necessary depending on the controller. I suppose you have a
'smart' one, which toggles HPD pin for you and thus get away with
the incomplete DT description. That doesn't make the DT correct,
though.

Greetings,

-- Sebastian

--apc47prpiboe3afh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIGvAACgkQ2O7X88g7
+poIVA//eXs3tXUgxkTwuS+7hQxrJDPUecT5f4XvOjZXRjIxJXn8A7olZaFQIYf4
WJ+yPefv89YMpzKu5bKAbP8nGNL/q787J6evjdiI3G+guguguhW66+FLstOAVPX4
pwGTKAgFqThsJrQE5wqaEy+At8F6MEd5IfK60EuqdRsMI6J0o4p9H8DDx6uAd+75
DOb/2t03RtgUJvKR8VQxHi0Qf7gId6rkAttFmZyeKnTDqpbUWlIy1gvYtYnb+ttC
xTO5dFQjE51hYFO1FIVu9KPK+4ncd6PNruprdTezEcW2EC8VBJOGHdnbL3Rj/Idn
nSwvTvobNY8bDeRa27l6YQ2uJLD7vUdtX8fBjz5g0uLRSQdt1+c3xScSmTShsBxP
+QHRAS2XqUWIJbF6TTywGPBgt3/DNXdOzLSJPYO5WUfOWQ3HQedMhCW3fKvNZfLw
9gZZCXmEoWu0MH1ftxyzMzKp6Y/kD3HBvgVtzljd5it/c99wDs+oZ/Zlb9browdG
7P+fXklk06oACYQWvUqkfIk3EDOCc0EBUhwqwNQfsZQhLbAMrk+a9lAP8t7dOOgj
+XLwmkusWMHsL6Ek3EHuJ5w1OzFmuomOzVhsRLJTuYRQHGpzTxxixzSa+BcOWMO0
wauTaDP1podGPCeCzSmcUTuZfYH8n0sMjYN8i4Opnfs75X2B52k=
=1NQT
-----END PGP SIGNATURE-----

--apc47prpiboe3afh--
