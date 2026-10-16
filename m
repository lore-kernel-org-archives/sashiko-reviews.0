Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF103B9956
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181432; cv=none; b=abFkV3dJinD3VwXgBOp6OVXKjffE4urgp6j1G2xulRvrr23ijxj6xAzI/C6jfDi8LzGjA9fiYFwRsXwb/Q3x2Zuqs8ErrDA9NCMcxVi3zAMvzuwY/iwoUwfa30kRKN9ayR4kU9HX9y+V3/Ms+pMIkJ+xqc5Gtln2se9KKI5vCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181432; c=relaxed/simple;
	bh=BbJJ0Icz73GKF3adL6+fhc0WHBGh8P9VYBHEVpJw2QY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dJBGc5Gc1UIvdZ3y9noQLiLXJy8EaMUQcJmF+7FfyxhQ1QYjnM+bsTXOk+4/jHRnOKeDVxPEFsNUIhmXVwtL1+icbQonBrqoVxbgoV+Zk0HlX9Pirhbx0Ex5Fmu9iUDxfX2auIk+jgBRjt3+C7lcBmOkmuRxJT5DsOG8kSDnjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LlzWe51C; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LlzWe51C"
DKIM-Signature: a=rsa-sha256; b=LlzWe51CSAUaB+wfiLumx9GQ1anMl1odgqA0SAU3gJ38e1yNXUAm4zSmUssTQn++g0Jx//3YMJ6/fqwOej4J2RejBdJg5DYK6DqsA+7TZmAmyRuDcv9UPVDQE1f+9Aeds4NFmP6q7OlinT5YNvNSlZwUzktLQc+6vZv0jYnh1nndeyJt88sCznsqTowaAY8bxEecBSHiJN+pmuo4irZ0eMdVQ91tNxN1LMmTyOaAMW6caL9QlpO3vXgtazIA8ZsYkEAh+2itYB7s42H0sZOyt2tA+WwYcz/REPoHjEfe3n8hFzIfQPy44o4M+XoO0PhXLkDymnoYfZ0BAQsnfshzAw==; s=purelymail3; d=purelymail.com; v=1; bh=BbJJ0Icz73GKF3adL6+fhc0WHBGh8P9VYBHEVpJw2QY=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: sashiko-reviews@lists.linux.dev
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2075373098;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 16 Oct 2026 20:10:24 +0000 (UTC)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 22:10:22 +0200
Message-Id: <DM6JAJBV9B5B.1BKWD3L6555MH@mentallysanemainliners.org>
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: <sashiko-reviews@lists.linux.dev>, "Igor Belwon"
 <igor.belwon@mentallysanemainliners.org>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
X-Mailer: aerc 0.22.0
References: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
 <20261016-nezha-v1-1-a39900dfaadd@mentallysanemainliners.org>
 <sashiko-outbox-174893@kernel.org>
In-Reply-To: <sashiko-outbox-174893@kernel.org>

On Fri Oct 16, 2026 at 10:08 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dt-bindings: arm: qcom: redundant xiaomi,nezha in 2-item kaanapal=
i enum
> --
>
> commit 48f6e1cb0f2052f10bc7093b9567a5e4e0437429
> Author: Igor Belwon <igor.belwon@mentallysanemainliners.org>
>
> dt-bindings: arm: qcom: Document Xiaomi 17 Ultra devices
>
> This commit adds compatible strings for the Xiaomi 17 Ultra EU and CN
> device variants to the Qualcomm arm board bindings.
>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documenta=
tion/devicetree/bindings/arm/qcom.yaml
>> index 121ca557ce1ef..b0eb7c912b913 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -173,10 +173,19 @@ properties:
>>                - qcom,hawi-mtp
>>            - const: qcom,hawi
>> =20
>> +      - description: Xiaomi 17 Ultra
>> +        items:
>> +          - enum:
>> +              - xiaomi,nezha-cn
>> +              - xiaomi,nezha-eea
>> +          - const: xiaomi,nezha
>> +          - const: qcom,kaanapali
>> +
>>        - items:
>>            - enum:
>>                - qcom,kaanapali-mtp
>>                - qcom,kaanapali-qrd
>> +              - xiaomi,nezha
>>            - const: qcom,kaanapali
>
> [Severity: Low]
> Should xiaomi,nezha be omitted from this two-item qcom,kaanapali enum in
> properties:compatible:oneOf?
>
> The Xiaomi 17 Ultra block right above already defines xiaomi,nezha as the
> intermediate base compatible beneath xiaomi,nezha-cn and xiaomi,nezha-eea=
.
>
> Adding xiaomi,nezha to the two-item enum as well allows a device tree roo=
t
> node with only compatible =3D "xiaomi,nezha", "qcom,kaanapali" (missing t=
he
> required -cn or -eea regional variant compatible) to pass dtbs_check. Oth=
er
> multi-variant devices in this file (such as xiaomi,beryllium) only list t=
he
> shared base compatible as a const in the three-item entry.

Acked, my mistake. Will be fixed in a v2.

Warm regards,
Igor

>
>> =20
>>        - items:


