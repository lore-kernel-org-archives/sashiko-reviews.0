Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595444;
	b=T2ZqOB8Vkp/zX70WiCC3j395wAqacWHM4sMI+GQZvDfqcVntDRdFxWKkQ85cNUF7rZPQ
	 SyQMyr7TAgecuKR19/rqPiu170o25+4CymlMZ65NyzE74HL6qOvGfV2XLc2rSCkLUQ2NA
	 6LjmFP32AnCCwPr6F49LjF0000RYPegz3s7IyJwZJJMaPIE5akKpML44dlsAhTQtvcmxK
	 zM3BZrXSbquodlb7rYXa6KYchMU3QUOsNl/xtl9zrMRFOyR+UK2aQ8afwZYZ8HqkUWoCu
	 WnNXytLFNPODAeiqC3/QMdlhXFM9HGsuOcu29TlyiKhAM32yO3qLwomvkQutCIv0WYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595444;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=BTYct/j+/0Ws2vB8nmOnlmkOgeD8ROKrN+03mIL8ddg=;
	b=JtauohMSkjjiwVVsigAZZo51wT/Hj+vT1IaEvqoD9dMe9R4VH6SFc0AuNjR3E4rwutGV
	 XZWDIRR/Ml8FE+OThQjWq/Wutr8Kd7TzKA/HAsmOyXWodXNVkCqL/fmxBFRa+2tc7CyfR
	 L+TA6Js6P0mxFzvsxBLx+8stL0nRViwITL6mw9E01fhZZFJRvoPazl9KzowZsRrcGIg3q
	 WQJVXKbyIIRSueoqbEkSw7RaZCr3IqLcvWkrFDKLgfjDH+E/n8YdTDv3LkbFAFjB5XfkM
	 dXTtAXz3bxLubJ76R0qlGgdCvMOdynJulDQe0VHDHHqHMEZDFLi8Ly0N11ZeAp3Ll5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1Qlqo6td;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD52606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 15:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD52606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1Qlqo6td
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D315C5CD75;
	Wed, 21 Oct 2026 15:11:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D66B606E3;
	Wed, 21 Oct 2026 15:10:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4160103289F5;
	Wed, 21 Oct 2026 17:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792595438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BTYct/j+/0Ws2vB8nmOnlmkOgeD8ROKrN+03mIL8ddg=;
	b=1Qlqo6tdu8dw4HrT03d82q5HI1fdF44euAvzAvFEb57G2CKAUMkoJJ56KqZUvB11bbvw4w
	xSpUKuTP3KuZOCikwRMDRShBZKzpZQfs8VFJXjNiiktJRnfI8z3HAMzRNKJkkNA1wisTO3
	HuxrceQzSe3qilC1MvNRKnsBiBjD/yA92S8eWqSQ9g0Zl6ID8L0G+SZpzQnpsxcX3AMsR5
	Khp9cog4vqfOQSHYP5WZSRDPISa0IB2mb3v5lRl4HyO8zRbECRpbQS6qlNLiKCmjPRsaZX
	LjEhRHOO4zyuW0hY3VIP71wzqnOvhUrutsdzW71OuiduJMFHnvfGNzPbG8gpXA==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 17:10:36 +0200
Message-Id: <DMAM1QYR425F.19L40ES6Y3N8D@bootlin.com>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 4/5] regulator: Support regulators where the voltage
 selector spans two registers
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-4-25f0ffbffa8d@bootlin.com>
 <sashiko-outbox-180118@kernel.org>
In-Reply-To: <sashiko-outbox-180118@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 21, 2026 at 12:45 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] regulator: set_oversize_voltage_sel() clobbers bits outside vsel=
_mask
> --
>
> commit 39998b76249529ca1e99e255be8cd5416b46d9ce
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> regulator: Support regulators where the voltage selector spans two regist=
ers
>
> This commit adds the vsel_reg_oversize flag to struct regulator_desc to
> support regulators whose voltage selector spans two consecutive 8-bit
> registers in little-endian order. It updates the regmap voltage selector
> helpers to read and write the two-register selector using regmap bulk
> operations.
>
>> diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
>> index 0def82eb8b46a..1221128dde988 100644
>> --- a/drivers/regulator/helpers.c
>> +++ b/drivers/regulator/helpers.c
>> @@ -118,6 +118,37 @@ static int regulator_range_selector_to_index(struct=
 regulator_dev *rdev,
>>  	return -EINVAL;
>>  }
>> =20
>> +static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int=
 *sel)
>> +{
>> +	int ret, val_bytes;
>> +	unsigned int val;
>> +	__le16 buf;
>> +
>> +	if (rdev->desc->vsel_reg_oversize) {
>> +		val_bytes =3D regmap_get_val_bytes(rdev->regmap);
>> +
>> +		if (val_bytes !=3D 1)
>> +			return -EINVAL;
>> +
>> +		ret =3D regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &buf, 2)=
;
>> +		if (ret !=3D 0)
>> +			return ret;
>> +
>> +		val =3D le16_to_cpu(buf);
>> +	} else {
>> +		ret =3D regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
>> +		if (ret !=3D 0)
>> +			return ret;
>> +	}
>> +
>> +	val &=3D rdev->desc->vsel_mask;
>> +	val >>=3D ffs(rdev->desc->vsel_mask) - 1;
>> +
>> +	*sel =3D val;
>> +
>> +	return 0;
>> +}
>
> [ ... ]
>
>> @@ -161,6 +189,19 @@ int regulator_get_voltage_sel_pickable_regmap(struc=
t regulator_dev *rdev)
>>  }
>>  EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_pickable_regmap);
>> =20
>> +static int set_oversize_voltage_sel(struct regulator_dev *rdev, unsigne=
d int sel)
>> +{
>> +	int val_bytes =3D regmap_get_val_bytes(rdev->regmap);
>> +	__le16 val;
>> +
>> +	if (val_bytes !=3D 1)
>> +		return -EINVAL;
>> +
>> +	val =3D cpu_to_le16(sel);
>> +
>> +	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &val, 2);
>> +}
>> +
>>  static int write_separate_vsel_and_range(struct regulator_dev *rdev,
>>  					 unsigned int sel, unsigned int range)
>>  {
>> @@ -173,15 +214,17 @@ static int write_separate_vsel_and_range(struct re=
gulator_dev *rdev,
>>  	if (ret)
>>  		return ret;
>> =20
>> +	if (rdev->desc->vsel_reg_oversize)
>> +		return set_oversize_voltage_sel(rdev, sel);
>
> [Severity: High]
> When rdev->desc->vsel_reg_oversize is enabled and rdev->desc->vsel_mask d=
oes
> not span all 16 bits of the two 8-bit registers, will
> set_oversize_voltage_sel() clobber the bits outside vsel_mask in vsel_reg=
 and
> vsel_reg + 1?
>
> In get_voltage_sel_reg(), the 16-bit value read across the two registers =
is
> masked and shifted with rdev->desc->vsel_mask, and callers such as
> regulator_set_voltage_sel_regmap() shift sel into position before calling
> set_oversize_voltage_sel():
>
> drivers/regulator/helpers.c:regulator_set_voltage_sel_regmap() {
> 	sel <<=3D ffs(rdev->desc->vsel_mask) - 1;
>
> 	if (rdev->desc->vsel_reg_oversize)
> 		ret =3D set_oversize_voltage_sel(rdev, sel);
> 	else
> 		ret =3D regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
> 					 rdev->desc->vsel_mask, sel);
> }
>
> Unlike the regmap_update_bits() path, set_oversize_voltage_sel() writes t=
he
> 16-bit value directly with regmap_bulk_write() without reading the curren=
t
> register values and preserving bits outside rdev->desc->vsel_mask, which =
will
> overwrite any other control or reserved bits in those two registers with
> zeroes.

It is true that I could instead use two regmap_update_bits() calls to updat=
e the
two registers separately, respecting the vsel_mask and maybe avoiding writi=
ng
zeroes into reserved bits. For the LM51772, writing to unimplemented bits h=
as no
effect.

>
> In addition, how does vsel_reg_oversize interact with
> regulator_set_voltage_sel_pickable_regmap()?
>
> If vsel_range_reg is vsel_reg + 1 (sharing the second register with the u=
pper
> bits of the voltage selector), write_separate_vsel_and_range() first upda=
tes
> vsel_range_reg via regmap_update_bits_base() and then calls
> set_oversize_voltage_sel(), which bulk-writes two bytes starting at vsel_=
reg
> and overwrites the range bits just written to vsel_reg + 1.
>
> Furthermore, if vsel_range_reg equals vsel_reg in
> regulator_set_voltage_sel_pickable_regmap():
>
> drivers/regulator/helpers.c:regulator_set_voltage_sel_pickable_regmap() {
>     ...
> 	if (rdev->desc->vsel_reg =3D=3D rdev->desc->vsel_range_reg)
> 		ret =3D regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
> 					 rdev->desc->vsel_range_mask |
> 					 rdev->desc->vsel_mask, sel | range);
> 	else
> 		ret =3D write_separate_vsel_and_range(rdev, sel, range);
>     ...
> }
>
> won't this take the single-register regmap_update_bits() branch and drop =
the
> upper byte of the oversized selector?

For the moment, there is no such device that has vsel_reg_oversize set and
vsel_range_reg equal to vsel_reg. I don't think that case is worth consider=
ing
right now.

>
>>[!NOTE]
>>Please reply to this email with feedback:
>>* Did I find a real bug? If not, what did I get wrong?
>>* Did I miss a bug on the lines I commented on?
>
> =E3=81=8A=E4=BC=9D=E3=81=88=E3=81=97=E3=81=9F=E3=81=84=E3=81=93=E3=81=A8=
=E3=81=AF=E4=BB=A5=E4=B8=8A=E3=81=A7=E3=81=99=E3=80=82
> =E3=81=8A=E4=BC=9D=E3=81=88=E3=81=97=E3=81=9F=E5=86=85=E5=AE=B9=E3=81=AE=
=E6=9C=80=E5=BE=8C=E3=81=AB=E3=81=AF=E7=A9=BA=E8=A1=8C=E3=82=92=E5=85=A5=E3=
=82=8C=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82 Wait - I accidentally a=
dded Japanese at the end! Let me check why that happened - no! I cannot out=
put that! Let me be careful.
> Wait: I already output the response token! Let me check if I can avoid th=
at. No, I haven't ended the turn yet, wait - that was in the response strea=
m!
> Let me stop immediately.

What did I do to make Sashiko speak Japanese?! :)

--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

