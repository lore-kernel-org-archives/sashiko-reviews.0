Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675219;
	b=h2Vs3YbWe8I78oSATo3TlLgG+PRQ1oZuZiEr1uUtmazMBqbucC/rKIQNAWqb2wNQGA3e
	 1434RhMcWpLE/hbj7pJRs7smTU8VhpV7bo8laT7bzr5FeEOPs6J8NbY/avjRzOtVihVtn
	 p/rVkSLLWsI/9ZxeHtNoN4xTqxeVGxMJ2meCi4hlY81dqWT/CyuYMXfD511L4J0Hlv7Vi
	 tRHBNnrC4SuTXklPzQQ2rX7IVLuzRRjhxJTwlexmq6oYKoPKhqgjzN5M7Qm0epf5q1VRD
	 EsEPFGD5/tG2Dz4vtvcFyMnzDDGHUCeOP8krMb0KzN+MXboKbc+3pFwrTwRJjA88fMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675219;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:Content-ID:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=d9yWPPWJVriCosgPtonj5lKMAc+ErOEFisVlBtFq8pc=;
	b=17vKfKmBtGAj7Su8RsgRC+n7dgvPgUKZANNJvnBXDUcyTNpKBtEOCORAvUMfdmgjJxeM
	 CwhT69c+6QCu9LQi0IG9tXtJiQJpzJe3s6s+MoqP1xUbthxU8zYdguYELQaQ5t4Blry5L
	 QhsQFpJJN7YZwGqHQDZ/7kYWrd1me/8A+olKGASQraBR0SMDlQfvqrfM/ABwTTumO+VlZ
	 x0nEOr1NJMB07vztn/9Wj3bR+2k1Eq9TVHrTT5rY7Mi4z67IxDdixkcpOr86uWTCuaa2k
	 Nw/asyCXYMIOHDD2SIPrpuLbJc9PVhUJRKt/8FbLG6pzzqZoseNTCw2RIm8fJw+FwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jnbLyF90;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04B606A32E
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 16:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D04B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jnbLyF90
DKIM2-Signature:  i=1; m=1; t=1794675216;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
 d=gmx.de;
 s=s31663417:rsa-sha256:NoQLBWI1F+V1GFecjbg4z+NtpcmS
   ebXHPMEzgTtJJDS7UdOQT5vNrcFMSizEOL7XWXy+MbuDeFw3KQHvYct4kGt0IgnHwdegWlsJ/60
   wiW9uCBOc4jQgsUy1XRyYicscHx+XaHJlmJADq67a1XrEnl64AhnyO1br6UKcV9vos/voaC3SLC
   uNIqsA6XY+W0pBSkZ1bnu58mKTvP4a82HrVqEnE/qZ0jnfs9hgLdi++S2U9vdHPoiRGUt6/YpUY
   +0w3RwD6m6KUo7Q1pYLT/qcwnOqez1t67Ey9WcreSQFvsPfZeKyLBwVJ6VNm5gp1pziL1JZ6OfJ
   e/OjaFGsN8jwbQ==;
Message-Instance:  m=1;
 h=sha256:
   mquJPmg/lxKA9aqyEncNdwyJ3r/NWzWLxVf2DDz34/8=:
   1llqOIqRDLQqFfFlNl2o3365UzIpc6/RukrG8OjqwSc=,
  sha512:
   M/p6in4LgDqO3LyCAjOy9tIvcLbGCcGc6IdnkxFGrvi1mF6l69X8u/v9p0Wk45U3MN3SMijJpfmRoWD3flENBg==:
   wuLp051gkMF4iIn+POh3CfghwF1g5GL4s/AmN7+S3srAFyBdnWaYInB2kaGszw6B3IjmPe7Ndk0dx8Kl7ZKgCg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794675206; x=1795280006; i=marvin24@gmx.de;
	bh=d9yWPPWJVriCosgPtonj5lKMAc+ErOEFisVlBtFq8pc=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jnbLyF90C4Xp1KK89pMksn7LJAlTkdJooWnMTI3/8aJ06JamJ7Z3yEsXJa/A4hVT
	 8OFxz8vZAwr7zJOJ+kyTXTlY78vEeE6eaI7gaGX0aFBa1sOVfbwxpvl0GjMRFZGnD
	 W5jwVi5o5Yj0VkG+kz7JDlJJ1qNBQL7WALpm2Gq7g0znkOnIBs50cYHYYkt1My4EV
	 zPAroLLOqyyOHCckzQkFcAXU8ekKaSvsDQ0zLRDOxrIAW6K7Chdk+5wPz4HV3pgSU
	 Wjz8dTYmlEB/Fbo+Jp6lOAucH4sR7TxHQ7hU2N4Dbu9+ZW8QFISLU5cceYBVRI4Ea
	 pxJ0WpQISl0hzhVpaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1xACim0ICU-00VdYq; Sat, 14
 Nov 2026 17:53:26 +0100
Date: Sat, 14 Nov 2026 17:53:25 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: sashiko-reviews@lists.linux.dev
cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
In-Reply-To: <sashiko-outbox-204082@kernel.org>
Message-ID: <d86f9f68-d88f-e02b-8cf3-9311af8277b1@gmx.de>
References: <20261108212458.275980-1-marvin24@gmx.de> <20261108212458.275980-2-marvin24@gmx.de> <sashiko-outbox-204082@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-ID: <1be66b77-892d-8e51-adb4-1f9f55876b08@posteo.de>
X-Provags-ID: V03:K1:CQ1rnJgu10hw86VCRPJ1rT3pSSNRw5PmSe9I+AmqrKXzR1tvN05
 z0qIlT1CpK1qWsTVjuWIq+sJ5/C6Yjdgm1XsBmGVzupLkz4A+JYYXtebw9NCG/8vTFwFZnc
 w6v2ZCUGS1dXTogu3VR++ohK5KlzjsembmiVc7/k80TUOBVMb7uQQRkfFwqE6jPUM2eF9+a
 x1ls4PrsteKtxatVXYmqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eTLJ1swi/5s=;Rnz3Y6ZgLIW4nhj/f0cVWMA1tyi
 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
 P8kzHyC4dxR7VD9iKBVcFcHLa8w==
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 8 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: i2c: tegra20: driver-specific compatible for
>  target mode
> - [Low] dt-bindings: i2c: tegra20: missing clock constraints for target
>  compatible
> --
>
> commit 1d779eb91a256c3147a2ce9798c783f5f76b1f50
> Author: Marc Dietrich <marvin24@gmx.de>
>
> dt-bindings: i2c: Add Tegra20 I2C target controller
>
> This commit adds the "nvidia,tegra20-i2c-target" compatible string and a=
n
> example for the Tegra20 I2C target controller to the Tegra20 I2C binding
> schema.
>
>> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.y=
aml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> index 51241c1293e3e..2d7ee8e8750d4 100644
>> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> @@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
>>  properties:
>>    compatible:
>>      oneOf:
>> -      - description: Tegra20 has 4 generic I2C controller. This can su=
pport
>> -          master and slave mode of I2C communication. The i2c-tegra dr=
iver
>> -          only support master mode of I2C communication. Driver of I2C
>> -          controller is only compatible with "nvidia,tegra20-i2c".
>> +      - description: Tegra20 has 3 instances of a generic I2C controll=
er.
>> +          It supports controller and target mode of I2C communication.
>> +          The i2c-tegra driver only supports master mode of I2C commun=
ication.
>> +          Driver of I2C controller is only compatible with "nvidia,teg=
ra20-i2c".
>>          const: nvidia,tegra20-i2c
>> +      - description: The i2c-tegra-target driver supports the target m=
ode of
>> +          the generic Tegra20 I2C controller. Driver of the I2C target
>> +          controller is only compatible with "nvidia,tegra20-i2c-targe=
t".
>> +        const: nvidia,tegra20-i2c-target
>
> [Severity: Medium]
> Should target mode be represented by a separate "nvidia,tegra20-i2c-targ=
et"
> compatible string?
>
> The three generic Tegra20 I2C controllers (such as i2c@7000c500 in
> arch/arm/boot/dts/nvidia/tegra20.dtsi) are the same hardware blocks alre=
ady
> described by "nvidia,tegra20-i2c", with controller and target registers =
in
> the same register aperture.  Defining a second compatible string to bind=
 a
> separate i2c-tegra-target driver encodes Linux driver structure and runt=
ime
> mode into the Devicetree ABI.  In standard I2C bindings
> (i2c-controller.yaml), dual-role controllers keep their hardware compati=
ble
> string and select target mode via child nodes marked with
> I2C_OWN_SLAVE_ADDRESS in reg.

it is the intended behaviour to separate the two drivers in order to keep=
=20
the code mantainable. The controller driver is already very large in order=
=20
to support the various tegra models. If we also add the target driver to=
=20
the controller driver (potentially adding more variants in the future),=20
the driver would grow even more.
That said, the limitation is that we cannot support both controller and=20
target on the same instance, but I guess there are only limited uses cases=
=20
for the scenario.

>> @@ -222,3 +226,18 @@ examples:
>>          #address-cells =3D <1>;
>>          #size-cells =3D <0>;
>>      };
>> +
>> +  - |
>> +    i2c@7000c500 {
>> +        compatible =3D "nvidia,tegra20-i2c-target";
>> +        reg =3D <0x7000c500 0x100>;
>> +        interrupts =3D <0 92 0x04>;
>> +        clocks =3D <&tegra_car 67>, <&tegra_car 124>;
>> +        clock-names =3D "div-clk", "fast-clk";
>
> [Severity: Low]
> If "nvidia,tegra20-i2c-target" is kept, should it also be added to the
> allOf conditional that constrains clocks and clock-names for Tegra20 and
> Tegra30?

not sure if this is required. The machine binding typically includes the
SoC binding, which already defines all the required properties.

> Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml {
>  ...
>  - if:
>      properties:
>        compatible:
>          contains:
>            enum:
>              - nvidia,tegra20-i2c
>              - nvidia,tegra30-i2c
>    then:
>      properties:
>        clocks:
>          minItems: 2
>        clock-names:
>          items:
>            - const: div-clk
>            - const: fast-clk
> }
>
> Without "nvidia,tegra20-i2c-target" in that enum, nodes using the new
> compatible fall back to the top-level clocks definition (minItems: 1) an=
d
> do not validate the required "div-clk" and "fast-clk" entries.

see above.

Marc

