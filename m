Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B433FE33
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774911; cv=none; b=pmYJvMJv2/CgQymZOnf8lFpzbl6eSATLInX/gT0wMbTHTtZZc0YYLHo1jYGfmse+q7SkKc3wZHhlR6bC6QMoqtsXKk8dxnAXAw6JSsRFNALrJbbY1ouatXbYV7XT7uKodyazkH7AtqofVAsE6itV5YuFYJR7UZujfJwNtb0b1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774911; c=relaxed/simple;
	bh=y5FS1oisbj2zn4vjD9DfpC/1IgWZBFnhbNGMCFWYkkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ec6cd+HpXkAKigbFv+h8v+sTroxElQa5JNt1DlHKCE+exr9fQsBwyDSqGN44BP6ff4wIFMMvsnmr2jIzrx7i6GtFbtJTkNh/Roc006DmRa+Z7xz773wbPntNlDKf56Xh2OcmPVUzyqQphuw62v+LsV0q3i7Nr+S86tInuVm+fS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sRPRkwlJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OR/2miVv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sRPRkwlJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OR/2miVv"
Message-ID: <8bd5c543862fdb0083a218953b0db1937da2f320.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785774906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pFVbNVNRo+6WiBVgfD1ZgVgCN4OqyhT686jeY6ylJc=;
	b=sRPRkwlJ+qJ1toWOwMTxofAibigfCFWmoCvWMTfXi5fYxY5UGHaILBYteXBmjkQ3+i4ABN
	Jd9Blz/I3tIUGrCWfw74vzG+XkSv5aRSaJEll9E6b26+/5sDQQk/Q5uPbjQ2LJ3BIbUFJ4
	VDJe/2XBHKMBYmefalkfvU5t9MaRyAwNwE1Fdc6Z3791OtDWUymjNkTqdB27gj0+elyJDU
	zDudiQTqDONXRSbgHM70zgTli1KAGWuMRs20d0oIoo1W/1azwG4NuTVLruI1VLP/s82Fl5
	Fe9vEWT65Tk6SYOYz3zsEDkG95wtuWcKP+agMWZZfHzrfxYvTQY1PFmnn8bckQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785774906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pFVbNVNRo+6WiBVgfD1ZgVgCN4OqyhT686jeY6ylJc=;
	b=OR/2miVvjXgtT77UzWvHeeTaD99Lhv6dMEGVYNmrphShCRoNxno9WgkvLdKUe/lYC5oNZg
	6rrrA4P4YOJbtmCA==
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: Add SoC-e switch IP and DSA
 bindings
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Date: Mon, 03 Aug 2026 18:35:05 +0200
In-Reply-To: <20260730163757.B40901F00A3E@smtp.kernel.org>
References: 
	<20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
	 <20260729-devel-vstrassheim-soce-dsa-ml-v1-2-be569dae1b20@linutronix.de>
	 <20260730163757.B40901F00A3E@smtp.kernel.org>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-07-30 at 16:37 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [Medium] The `mdio` bus models a Linux software-synthetic topology rath=
er than the actual hardware layout, misusing `reg` and inventing custom phy=
sical address properties.
> - [Medium] Setting `unevaluatedProperties: false` on the child `ethernet-=
phy` node breaks validation for vendor-specific PHY properties.
> - [Low] The device tree example in `soce,switch-dsa.yaml` fails to compil=
e because it references undefined phandle labels (`&soce_switch_ip` and `&g=
em3`).
> - [Low] The device tree example in `soce,switch-ip.yaml` provides a 4-cel=
l `reg` property without a parent node specifying `#address-cells` and `#si=
ze-cells`, leading to validation failures.
> - [Low] The `ports` sub-node pattern property description claims to defin=
e vendor-specific properties, but none are actually listed or defined.
> - [Low] Unnecessary `#address-cells` and `#size-cells` defined at the roo=
t node level, causing dtc warnings.
> - [Low] The `soce,num-ports` property is missing constraints that are exp=
licitly stated in its description.
> --
>=20
> --- Patch [2]: [PATCH 2/4] dt-bindings: net: dsa: Add SoC-e switch IP and=
 DSA bindings ---
> commit 28c590589436788e107ab82bf7fbd0fdcad40087
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
> Subject: dt-bindings: net: dsa: Add SoC-e switch IP and DSA bindings
>=20
> This commit adds DT schema documentation for SoC-e FPGA switch devices.
> The binding is split into a switch IP node describing the MMIO register
> block and a DSA MDIO node describing the DSA-facing switch instance.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.=
yaml b/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.yaml
> > new file mode 100644
> > index 0000000000000..a04e2838d14eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dsa/soce,switch-dsa.yaml
> > @@ -0,0 +1,195 @@
>=20
> [ ... ]
>=20
> > +properties:
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
>=20
> [Severity: Low]
> Are #address-cells and #size-cells necessary at the root node level?
> Since the only allowed sub-nodes (ports and mdio) do not use a @
> unit-address, compiling device trees conforming to this schema might emit
> avoid_unnecessary_addr_size dtc warnings.
>=20

I will fix that.

> [ ... ]
>=20
> > +  mdio:
> > +    $ref: /schemas/net/mdio.yaml#
> > +    description: |
> > +      Optional child MDIO bus exposing PHY devices attached to switch =
user
> > +      ports. PHY nodes referenced by port "phy-handle" properties shou=
ld be
> > +      placed here. The PHY address seen by Linux on this bus is the sw=
itch port
> > +      index, not necessarily the hardware PHY address selected interna=
lly by
> > +      the switch IP.
>=20
> [Severity: Medium]
> Does this model a Linux software-synthetic topology rather than the actua=
l
> hardware layout? Device tree bindings are expected to describe the hardwa=
re,
> rather than modeling internal software abstractions like Linux's syntheti=
c
> MDIO bus mapping. Using custom properties for the hardware bus index inst=
ead
> of natural mdio subnodes might violate core DT design principles.
>=20
I will rewrite this.

> > +    unevaluatedProperties: false
> > +
> > +    patternProperties:
> > +      "^ethernet-phy@[0-9a-f]+$":
> > +        type: object
> > +        $ref: /schemas/net/ethernet-phy.yaml#
> > +        unevaluatedProperties: false
>=20
> [Severity: Medium]
> Will setting unevaluatedProperties: false on the child ethernet-phy node
> break validation for valid vendor-specific PHY properties? Device trees u=
sing
> specific PHY hardware with valid vendor properties (like ti,rx-internal-d=
elay)
> might fail schema validation because the parent schema strictly forbids t=
hem.
>=20
Yes, I will fix that.

> [ ... ]
>=20
> > +  ports:
> > +    type: object
> > +    description: Container node for the switch port sub-nodes.
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port@[0-9a-f]+$":
> > +        $ref: dsa-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: |
> > +          Switch port. In addition to the standard DSA port properties
> > +          (label, phy-mode, ethernet, fixed-link) the following
> > +          vendor-specific properties are used for data ports connected=
 to
> > +          external PHYs.
>=20
> [Severity: Low]
> Could this description be updated? It claims to define vendor-specific
> properties used for data ports connected to external PHYs, but the descri=
ption
> abruptly ends and no such properties are actually listed or defined.
>=20

This will be updated in the next version.

> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    /* Excerpt from a Xilinx ZynqMP design (ARM64) */
> > +    mdio {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        soce_switch: switch@10 {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +            compatible =3D "soce,switch-dsa";
> > +            reg =3D <0x10>;
> > +            soce,switch-ip =3D <&soce_switch_ip>;
>=20
> [Severity: Low]
> Does this example fail to compile? The phandle label &soce_switch_ip
> does not appear to be defined in this example snippet, which might cause
> dt_binding_check to fail when dtc attempts to resolve it.
>=20

Yes, this will be fixed.

> [ ... ]
>=20
> > +                port@2 {
> > +                    reg =3D <0x2>;
> > +                    label =3D "INTERNAL_PORT";
> > +                    ethernet =3D <&gem3>;
>=20
> [Severity: Low]
> Similar to &soce_switch_ip, the &gem3 ethernet controller label also
> appears to be undefined in this example.

Yes, this will be fixed.

>=20
> > diff --git a/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.y=
aml b/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.yaml
> > new file mode 100644
> > index 0000000000000..ba9bb396235f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dsa/soce,switch-ip.yaml
> > @@ -0,0 +1,54 @@
>=20
> [ ... ]
>=20
> > +  soce,num-ports:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Total number of switch ports (external/user ports plus the CPU u=
plink
> > +      port). Must be greater than zero and not exceed the selected IP =
variant.
>=20
> [Severity: Low]
> Should there be explicit JSON schema constraints (such as minimum: 1)
> added for this property? The description mentions it must be greater than
> zero, but invalid device trees specifying soce,num-ports =3D <0>; might
> pass validation without the constraint.
>=20
This will be removed in next version.

> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    switch_ip: switch@80020000 {
> > +        compatible =3D "soce,mrs-24-01";
> > +        reg =3D <0x0 0x80020000 0x0 0x10000>;
>=20
> [Severity: Low]
> Will this 4-cell reg property cause a validation failure? The implicit
> parent provides #address-cells =3D <1>, so this might parse as 2 items an=
d
> exceed the maxItems: 1 constraint. It likely requires a parent node
> (e.g., a bus node) defining #address-cells =3D <2> and #size-cells =3D <2=
>.
>=20

I will fix the examples before resubmitting.


