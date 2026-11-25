Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623557;
	b=aJniErdh952vfhjxDqURC5c8Ci4WKUuhJ9LgWYaFZz1ij8b/NvCgj9XzxwT3LU911pZN
	 HJXaG1BXpGQG31fQhPSxoxwzy8iaPsWcbwrDSsGF6TtEtVMoA64r5VZiQALuxbIAu/Omr
	 PNJ01m/Gjv+Eppt4nxXuWv16+ujlzTlZW/Hw1T5tBcIASimUT+etqxgk4C1nh7ss4SJsd
	 kNs+tGnEh3coU4+e3ahJQ2NVLm+y4iMbzK2upFo5pqHIpvG1tWnakte9UutWq2hIYC4jb
	 C9p3hxV77AhA7YYBN7+m0msGx0OZXI6RlfYNpR0oEFLn2JTloAJiLr33l8T9O2uEQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623557;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1WbB1tMgALW3NqGumxVzVAHgBE1rM7IvVsTXuL9ngTc=;
	b=EGb0MXJfDfsQadnx5xCGHTrcAjTkCOgacOG2CbROkKwcljjj9OBdGkx2uLb/2Ju4EsfD
	 YUxHaxBHuOepnHsuaqkLlRhXdVsHTlzJBPFc6LfSp5B8hmJQLXpld64Cz/RPpcq2UhD8O
	 0VNSu6xR7XqohZHKjSVvGdvleES1iIrWvXr9IxLIJGsglohu5Dt10VDQnCU2Z2h2pfyzf
	 YLZAT8DialTCYQWorlbtEdXIEHCmzcG4LX/SyTHYi+QimX1x27HavuVfEgEGevGYFFgED
	 2o2nlNZajTYm53e4cmF3okJhLRJs3r/3MHXdFDU+LYxp2tpC5oJyhndL0zGK42DF1pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gPKSimfY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jh0KswrB;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D39606A329
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 16:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D39606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gPKSimfY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Jh0KswrB
Message-ID: <306495dafd14bfa6842d745a893bd86db24675da.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795623554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WbB1tMgALW3NqGumxVzVAHgBE1rM7IvVsTXuL9ngTc=;
	b=gPKSimfY2zmuhc0hzinN9krUjlZuKRx24kAobsXIXRJpf6HTBMvR5FKmLxvhPpedKKHwI1
	W/dgSuDo0F+Fzx9bG/cZtc/0nkF4Wp08hE71oA3odyvUSK7S6DOFy2HauaScNf7ROt9hIE
	R2VwkLxCzJq8J1V8He4f2dDb0vynh2G3acSazLXVyn4qSTpT2cMuFiPYeikcw7tKB7Zq+5
	UDrYfNlc32KaRUxzL9xnJQgSw9QgYTV2WZoWgcH3N4OHpoeA44fkgt4wfLX6yRqsnP+9D9
	W2mQJ+yzxUW9l5Z+IMf5Ev56/It9efX1voPXGaE4B7IYQzRgW9AxA+l2roicDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795623554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WbB1tMgALW3NqGumxVzVAHgBE1rM7IvVsTXuL9ngTc=;
	b=Jh0KswrB6g6QB8dI7eoG0QCKBr+2YnuZsM6MFiz7fZE2OToyegdllZDhz/K7eDzJErhDF/
	5jkUErbQmsckJMBg==
Subject: Re: [PATCH net-next v5 4/9] dt-bindings: mfd: Add SoC-e SWIP parent
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 25 Nov 2026 17:19:13 +0100
In-Reply-To: <sashiko-outbox-227108@kernel.org>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
	 <sashiko-outbox-227108@kernel.org>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-21 at 14:53 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: soce,swip: overlapping switch child and
>   split MDIO reg
> --
>=20
> commit beb83bca6b797666b59f03629a91afa93df57a6e
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> dt-bindings: mfd: Add SoC-e SWIP parent
>=20
> This commit adds a Device Tree binding schema for the SoC-e SWIP
> multifunction Ethernet switch FPGA IP core and its child nodes.
>=20
> > diff --git a/Documentation/devicetree/bindings/mfd/soce,swip.yaml b/Doc=
umentation/devicetree/bindings/mfd/soce,swip.yaml
> > new file mode 100644
> > index 0000000000000..69bb9eae379f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/soce,swip.yaml
> > @@ -0,0 +1,138 @@
> [ ... ]
> > +  ranges: true
> > +
> > +  ethernet-switch@0:
> > +    $ref: /schemas/net/dsa/soce,swip-switch.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  mdio-mux@202:
> > +    $ref: /schemas/net/mdio-mux-mmioreg.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  mdio@204:
> > +    $ref: /schemas/net/soce,swip-mdio.yaml#
> > +    unevaluatedProperties: false
> [ ... ]
> > +examples:
> > +  - |
> > +    ip-core@80020000 {
> > +        compatible =3D "soce,swip";
> > +        reg =3D <0x80020000 0x10000>;
> > +        ranges =3D <0x0 0x80020000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        ethernet-switch@0 {
> > +            compatible =3D "soce,swip-switch-00-04-0c-10";
> > +            reg =3D <0x0 0x10000>;
> [ ... ]
> > +        mdio-mux@202 {
> > +            compatible =3D "mdio-mux-mmioreg", "mdio-mux";
> > +            reg =3D <0x202 0x2>;
> > +            mux-mask =3D <0x07ff>;
> > +            mdio-parent-bus =3D <&mdio_parent>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> [ ... ]
> > +        mdio_parent: mdio@204 {
> > +            compatible =3D "soce,swip-mdio";
> > +            reg =3D <0x204 0xc>, <0x200 0x2>;
> > +            reg-names =3D "data", "control";
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +        };
> > +    };
>=20
> [Severity: Medium]
> As reported by Krzysztof Kozlowski on v4 [1], should the parent IP core
> and ethernet-switch@0 be combined into the ethernet-switch node instead o=
f
> using an MFD wrapper where the switch child claims the entire 0x0..0x1000=
0
> parent MMIO range?
>=20
> Here ethernet-switch@0 claims reg =3D <0x0 0x10000>, which overlaps both =
the
> parent register at offset 0x0 and the sibling MDIO registers at
> 0x200..0x20f.
>=20
> In addition, mdio@204 (reg =3D <0x200 0x2>) and mdio-mux@202 (reg =3D <0x=
202
> 0x2>) split a single 32-bit MDIO control register at offset 0x200 into tw=
o
> 16-bit halfwords across two sibling nodes.  Handling the mux selector bit=
s
> directly in the MDIO controller node and driver avoids splitting one
> 32-bit hardware register across mdio-mux-mmioreg and soce,swip-mdio, and
> allows the MDIO driver to check that the controller is idle before
> changing the selected bus.
>=20
> [1] https://lore.kernel.org/r/20261106-judicious-penguin-of-enhancement-b=
28c8b@quoll
>=20

This was already reported and addressed there [2].

[2]
https://lore.kernel.org/netdev/20261120-devel-vstrassheim-soce-dsa-ml-v5-0-=
5de9225715e6@linutronix.de/T/#m7f14bf95fba3715d2e4e7be5ebc5ff865d270a79
