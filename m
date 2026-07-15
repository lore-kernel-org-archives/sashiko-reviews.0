Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584D3B0ACD
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136490; cv=pass; b=Ufg0PmvPvcGwIQ7bPpvwa5lLbxE+FIUiObFOJvI/AbWWRYZANUv7fLSv5kRLjBzkttJHGutLyCQPgU+bF0+U8gFCUnW6SN8G4HP6cwBtn5EwsgcqmTZTPyz+o0Oy2dJDWPXcwRm7F7T12qAMM2hBXum3Lh1TaeziY7Sa/XSJrCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136490; c=relaxed/simple;
	bh=1jC4zuorRjF4cG/NHwxsj8hoCNU1g953f2542WYm/LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMiNh6Q58BDtYcsgyn/bzHWAjx19pQ8vIfyjoLQI+rbXXLlr2M3R2HfMNUzOb1pyZNiJifagFxlIwxqs6X6AsjqA7+CiWObmz6bbWTEnXLFjLjZIiQh2T7RUho27fYi8DQGvPECE5TwVXGu1+/CFsiBLa6d2r+ea7QBLzoFxpOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=PtO0nTmm; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="PtO0nTmm"
ARC-Seal: i=1; a=rsa-sha256; t=1784136472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UjcggrEWhmhgIRBHEx5b5tvEdbd8vN2dYykiP4HoIoDhaWFFoGO7QrBggnEewtTBsRhKywr0GJFuX03oJuOSORC+t4nW+6dmXExebhaGEe5ZphVI42YgBHi5q73ziyieSIr74SdP8H2yZXT1s22OMoT2E0J4O+9egAq3wz6wMxM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784136472; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tZMHpOSI96u+8n6WmO36hC0tSDpgTHPYMyoHs8oUXVk=; 
	b=O00TT5g3vx9d7a4nyIkIBRYVNmvis0OurZ0giMeBbr1uJxj/tPOlbt7ksZeaPEWBhFDIhnZuYgskFoDmqy7W2fWHlDionyUGqHEthF/W0z3qBrT/sRKC/bNnBlPbTHr8zYH84qlBx7St3NJlqAKejl2hlSRH0Orj4LuZXsvckF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784136472;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tZMHpOSI96u+8n6WmO36hC0tSDpgTHPYMyoHs8oUXVk=;
	b=PtO0nTmmNTPH9mSfPCCt2pDBdBmwpQ9EbBwW0uYLumMP6uod41l1XJuK9c4qKz5F
	CZFA2AuoqNxw3pDHXHKJqOJ56QDAyK2exjr1ERI4l4HFmp7aEjIf2c+yaa5cFf87I4L
	ednlDNSQeEIGdH5rHZal+npTVgvEscL5qplALmzw=
Received: by mx.zohomail.com with SMTPS id 1784136470398407.1506848169139;
	Wed, 15 Jul 2026 10:27:50 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 225A1180820; Wed, 15 Jul 2026 19:27:46 +0200 (CEST)
Date: Wed, 15 Jul 2026 19:27:46 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-rx: add
 #sound-dai-cells
Message-ID: <alfCQd689ATJOdwM@venus>
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-2-royalnet026@gmail.com>
 <20260715055448.AEA021F000E9@smtp.kernel.org>
 <CAEWPSH7OqecBKvxUVtwFe4B9y0-=gsQ7vy6kdBHx-Nsne-Ct1g@mail.gmail.com>
 <aleBPE5YHlC7pLpi@venus>
 <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEWPSH4AYfSR_DBcLFr6a=SJxnAAcjoK612v+g-TpP046qTBmg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi,

On Wed, Jul 15, 2026 at 03:19:54PM +0200, Igor Paunovic wrote:
> For completeness: the driver part of the series currently wires
> up only the I2S interface (DAI 0); the binding now describes both
> interfaces as per the hardware.

Not implementing all features in the driver is perfectly fine.
Ideally you return -ENOTSUP if somebody tries to use the S/PDIF
DAI interface instead of I2S.

Greetings,

-- Sebastian

>=20
> Thanks for the review!
>=20
> Igor
>=20
> On Wed, Jul 15, 2026 at 3:00=E2=80=AFPM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Hello Igor,
> >
> > On Wed, Jul 15, 2026 at 08:55:37AM +0200, Royal Net wrote:
> > > > Should the constraint be set to 0 to follow standard device tree
> > > > norms?
> > >
> > > Fair point. The current RFC wires up a single I2S DAI, and for a
> > > single-DAI provider 0 is indeed the norm -- rockchip,dw-hdmi does
> > > exactly that for its one DAI on the TX side.
> > >
> > > The reason I picked 1 is that the controller also has an S/PDIF
> > > audio output path (the vendor driver exposes both I2S and S/PDIF
> > > DAIs through hdmi-codec), so a DAI index becomes meaningful if that
> > > second path is wired up later.
> > >
> > > Unless the DT maintainers prefer keeping 1 from the start to avoid
> > > changing the cell count if/when the S/PDIF DAI is added, I'll switc=
h
> > > to const: 0 in the next revision -- please let me know which you'd
> > > prefer.
> >
> > It should be 1 from the start as the DT binding is supposed to
> > describe the hardware and be stable. But in the next version you
> > should look into updating the commit descriptions to be less about
> > the kernel driver and more about the hardware. Maybe something like
> >
> > > The HDMI RX controller has two digital audio interfaces, one for
> > > I2S and one for S/PDIF. Allow referencing connections from audio
> > > codecs to these interfaces by documenting the missing #sound-dai-ce=
lls
> > > property.
> >
> > Apart from that it makes sense to document that argument 0 means
> > I2S and argument 1 means S/PDIF interface in the property description=
.
> >
> > Last but not least drop "A value of 1 lets a sound card reference
> > the audio DAI as <&hdmirx 0>.". Instead you can add this to the
> > example section at the end of the file.
> >
> > Greetings,
> >
> > -- Sebastian
> >
> > >
> > > Igor
> > >
> > > On Wed, Jul 15, 2026 at 7:54=E2=80=AFAM <sashiko-bot@kernel.org> wr=
ote:
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > - [Medium] Incorrect cell count constraint for single-DAI provide=
r.
> > > > --
> > > >
> > > > --- Patch [1]: [RFC PATCH 1/2] dt-bindings: media: snps,dw-hdmi-r=
x: add #sound-dai-cells ---
> > > > commit e6b0bac0b97f568ce749084e6c1e728bcd258b10
> > > > Author: Igor Paunovic <royalnet026@gmail.com>
> > > > dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
> > > >
> > > > This commit adds the #sound-dai-cells property to the HDMI RX con=
troller
> > > > bindings, enabling a generic audio codec to capture incoming embe=
dded audio.
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hd=
mi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > > > > index b7f6c87d0e06a..83c10d9997c8e 100644
> > > > > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.y=
aml
> > > > > @@ -78,6 +78,13 @@ properties:
> > > > >        The phandle of the syscon node for the Video Output GRF =
register
> > > > >        to enable EDID transfer through SDAIN and SCLIN.
> > > > >
> > > > > +  "#sound-dai-cells":
> > > > > +    const: 1
> > > > > +    description:
> > > > > +      The HDMI RX controller registers a generic HDMI audio co=
dec so the
> > > > > +      audio embedded in the incoming stream can be captured. A=
 value of 1
> > > > > +      lets a sound card reference the audio DAI as <&hdmirx 0>=
.
> > > >
> > > > [Severity: Medium]
> > > > Is this cell count constraint correct for a single-DAI provider?
> > > >
> > > > Looking at properties:#sound-dai-cells, the hardware exposes only=
 a single
> > > > generic audio DAI. Requiring a cell count of 1 forces device tree=
 nodes to
> > > > use a non-standard syntax like <&hdmirx 0> instead of just <&hdmi=
rx> for a
> > > > single resource.
> > > >
> > > > Should the constraint be set to 0 to follow standard device tree =
norms?
> > > >
> > > > --
> > > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202607150=
51939.64652-1-royalnet026@gmail.com?part=3D1
