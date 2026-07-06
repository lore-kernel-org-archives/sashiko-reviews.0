Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118B41F7F1
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338506; cv=none; b=bHAsHdeokYZFGqsFg6VeRFEAhGy1+mlXu5QpryksTS80uSI9b3UU7Acz6z5LUT7Sp2ISj34pI734Jd67OD1HnhsR649i8WxEj7GYymCKt4ezRBxg1w73vQhLnRitsSmZ2E9uzHw3yCu4Yk+jVAs5wOV5EYg+XLT0LpP3w6d3tQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338506; c=relaxed/simple;
	bh=n/lG3qzg0MPPy1aGOf10o7DExKighZO5qmL6KdofjgY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UHecBbBU4Pp9L9ZwSzRyxRzXKHP3B/F9hlPf5Wn0hF/ql4qm+uCBPl8l4BtN/ThCab7QQf9EvM7O9HBKpMdJHgeHOI/amZ1blVOl7feLbpsLhZoBRznpm2CoUskWVrbiIvIcijcLBbHHQH0xw2p7qsryKax1lXDofhfl+VTriQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CvkU0Ulc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CvkU0Ulc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5367B4E40CB2;
	Mon,  6 Jul 2026 11:48:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 136D5601A2;
	Mon,  6 Jul 2026 11:48:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F27C611BB8527;
	Mon,  6 Jul 2026 13:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783338501; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PyCq2ncTUHEtBIYDeTqodjqwkDtnovJSYWEYcy5UAyA=;
	b=CvkU0Ulc8o+E7GgCG8VC9u2KQ276jy1ufYo/2w/nTu0yR085z40CBPYOFbZV4rQ8wnB1XO
	N7ylgEwvV3Kw41sf8P7Akrxbi8jnhpGOdVKhPv4tTyJGk+pJuU3/N3PbZ922jeP33r6x3w
	n1UGUp16JMcepAM8n6yWpwbMWF8vhBBvYkHRcTQLujAscXAE3iRciXnCcnjMJQSXz9Q6fu
	D6ZfkGu7CZ8Ajgg55gt0tgAbeB3Hj4IjnpXGeihTW4QW16sRnv5xxOv1E+7arpWJP+lAQV
	5iEXK1xtKxFEoFcXtlMcuinlMshs0y8piku028197gT9XxiQPtQYK5P3+OM7aw==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 13:48:20 +0200
Message-Id: <DJRGQL29OXDY.30JR30BSDIRY8@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 02/12] dt-bindings: soc: fsl: qe: Set #interrupt-cells
 to 2 to support interrupt type encoding
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
 <20260703134002.C5DF51F000E9@smtp.kernel.org>
In-Reply-To: <20260703134002.C5DF51F000E9@smtp.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jul 3, 2026 at 3:40 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Schema unconditionally changes `#interrupt-cells` from 1 to 2,=
 breaking backward compatibility with existing single-cell device trees.
> --
>
> commit ea9fdfe75d38976a589a83706c16b469e2657dbe
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt=
 type encoding
>
> This commit updates the #interrupt-cells property constraint in the FSL Q=
E
> ports interrupt controller binding to support interrupt type encoding. It
> changes the required value from 1 to 2.
>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,=
qe-ports-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/f=
sl,qe-ports-ic.yaml
>> index 2b8e7b9c6d7a4..2b7c6b4f03892 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-port=
s-ic.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-port=
s-ic.yaml
>> @@ -23,7 +23,7 @@ properties:
>>      const: 0
>> =20
>>    '#interrupt-cells':
>> -    const: 1
>> +    const: 2
>
> [Severity: Medium]
> Does this unconditional change to const: 2 break backward compatibility w=
ith
> existing device trees?

Yes, unfortunatly.
An '#interrupt-cells' value of 1 was a mistake in the first place, because =
the
interrupt controller supports multiple interrupt types.

>
> Device tree bindings are generally considered ABI. By removing const: 1,
> schema validation (dtbs_check) will fail for any existing device tree blo=
bs
> that use #interrupt-cells =3D <1>.
>
> Should this be updated to allow both values (e.g., enum: [1, 2]) to safel=
y
> expand the cell counts while maintaining compatibility with older device
> trees?

Should this advice be taken into account ?

Thanks,
Paul.




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

