Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4089466B79
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605230; cv=none; b=odTMHK0MLvHmRD4RSnqfXhKs5q/Ptdx3zPEinPsnruMi9BJZVI5TB3EML0L2/zeM5/fbzpPeuISXa2k2mGZ8mhd5HcvY1NQkBCHTXn3BeQxDWaQJ1sA7pXgIPPXlnUn/9mk8TTEYxkWGY2ULOIr+DjPzylKytBP4NGUeYJi4IBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605230; c=relaxed/simple;
	bh=FURAT1JGHLGpZcx/dCsf46KlQtuSykeO5xA3pIekbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD+ZgUJaJGV1isCsbMltSAslY+KHWgYcxrqfhYy8x92cIxAUIQKTHdpHxX6cCnTH5sSZr455iZVO3EfRlYDv1MVOkLIfqid3KFMkUr9yAmj7iF4arxEhEjOXS6seqhQTl/94pSTTJRx5rpBqS2TK+aKFKfd4JasQop3okJQjl7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=KXRj1Ek1; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="KXRj1Ek1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788605199; x=1789209999;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=arIaNXDw17FhzBN3sfpYfx0owHPFunTxf476/t+MRiI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KXRj1Ek1skOOoOv0/DoqHJfpaQ5eY/iQJhv9A3mJyFSzELpZlAi0HmFySa8+H/lF
	 G4pqoMKS3NclGFg3uXSkO24fdEEMryO1/TqynCs3j3wHOgV2G6ZibLH/lCACL6kzT
	 DoF7ecXQi0PN3T3ZoFt19Nk4zDMdxfpmeNASe6jbkx7KbdXibd6ibfm/mqc2Ux6ie
	 3tdllFmy0DLb7usCz0mG8xw6azLeoSp1bmci6jLBWBLQ6MQSiQTIa+zGOaA4NUXQl
	 G6Ub8mjOjtWdAZR7wklV2hfMHsVpsn21xoZ5UAHlsVoQuBdDiF3EXj0hzK81uaHKT
	 FzL+9/UXJyKaSWriTw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCbVD-1xAk0q1EjD-001FCP; Sat, 05
 Sep 2026 12:46:39 +0200
Message-ID: <8631fd93-36d0-418b-bad7-fdb8919c791a@oldschoolsolutions.biz>
Date: Sat, 5 Sep 2026 12:46:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
 <20260905094245.0320B1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260905094245.0320B1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cWKpyw05iz+U2E1ZIG5b0mfUKPEE0WZf7VEyWKEgVTe2WTOLsLA
 dVEppAFXTGmmHdMnn74LvoqMdT2Fe+9kitBsAUe2HnLOQaAqH3IqP8UpfNCZHMJI8T2hdOD
 4alENmSQUi18qpr77/nAnUaTl5DslpPi9SvcOkqHZMn6AJI8nTOtVLySYAx1rtvt8RH/4qB
 cWW+5FEASBpoXOfKcHnnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z84DrGtxv1A=;GbpXBenpIgzIEmGU7ZgoX0kib/H
 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

Hi Sashiko-bot,

On 05.09.26 11:42, sashiko-bot@kernel.org wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
>> index 6c2ac11133ca7..e6105e5790954 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -167,7 +167,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-sony-xperia-yo=
shino-poplar.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-xiaomi-sagit.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+=3D purwa-iot-evk.dtb
>>  =20
>> -purwa-iot-evk-el2-dtbs	:=3D purwa-iot-evk.dtb x1-el2.dtbo
>> +purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs :=3D purwa-lenovo-ideace=
ntre-mini-01q8x10.dtb x1-el2.dtbo
> [Severity: Low]
> Does this unintentionally remove the composite rule for the existing
> purwa-iot-evk-el2 board?
>
> Kbuild will fail with a 'No rule to make target' error when building bec=
ause
> dtb-$(CONFIG_ARCH_QCOM) +=3D purwa-iot-evk-el2.dtb remains slightly furt=
her down
> in this Makefile, but its underlying composite dtbs definition has been
> overwritten here instead of being preserved.
>
Oops, that was not intended. Will be fixed in v2.

with best regards,

Jens

