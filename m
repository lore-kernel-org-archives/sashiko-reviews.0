Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911C3ED5D0
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180683; cv=none; b=j+TNvViPSEbjg1zBsjiKNtBqlRb6IA/dKdASehtKLryzacf4U5xtFYLlkgNE1RZkgNcmyQNfWh2P3u6gkRiHQTI7y6ESKYojPxmEmVdxVtBACW3DfarZM2XkiElF+c3/f5uXfzhr986OIGNIdjvzfVjDaGjOvSprwzSg8BeojjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180683; c=relaxed/simple;
	bh=ejMIJ7K4AL/QbCIEwHN2FxoTF03Jlrkv3OEcOoovak8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TURBwLHF0AV4ak8D1oAREc4WLaPu0hus9PekE6JCXwZ6otBTFltuOeOQyUGkgNAx53zUja66R+hID5zSKN1OvuZjWZEF7po1fNVltdXqp0fGhj0Irl5o2tNhJCMGu4JvIatHEtTS46OgKubCYm24d1F93nDO6lSxiG+bhsQROjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIeL0d+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt40/yyI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIeL0d+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt40/yyI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJ8X284156
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 12:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=; b=dIeL0d+5048vaw/M
	toCCMUDpgxvu7eqRxY+2cvsABB5QcbNhQFHn7ox/DbZNwDkBucUugiaNcBtsG/5s
	3wqFT1whzwBE3LbOkfiIpUFzuw+SbvLL/Rz8wdOTDn+KQ9vOa5//kzV3xJpGMtVP
	TKxtfYExsp2JNBihmJXTnjsie0iICCVPRDeiva4hq/RS7Eh1DXCGlRiypJr5mRcX
	NChs5iOegpifzh7TB0j2PaJ77qhZd24jii+yHIaJtJyspCHvaKiDXEtxrZcb4tLn
	zBYPALisl0nf/NL56BP/7/oavF54TJSsXdVZs5HWobPiEUW4/xA//YmY+d8qzbdT
	Klruhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tkcdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 12:24:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768072950so108447741cf.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180680; x=1781785480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=;
        b=Qt40/yyIlffCRaOxXC2PbmnrO8JbgkIi/276PyIS3umvSIkCtAcvp1rCrWbiMhoAYz
         CGyhqsXIzZgYudmR3y4t7UUky7/fabmgDlACZONaABI81HBEkNPcuglFI57rwszqS8ap
         sHD2Q0xsq8En+x/Qp3qRgYKOu11xo/boj1C5nSSHIYbbJOdrrtoiqGCX9iv/VX5nUkVT
         bgm7FFz0M5VaMmec/70GU75iahPCWY+axINItFHTSmKo6QqyLJdVQeGNU/dUt8toIZzH
         D3uEmHBJLShYZQpTxp19/+rZYBcWtS9Alv3XOYluU1lcnsMl2oyPJ7kMmfBBzrPe1P9F
         pHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180680; x=1781785480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeWhGImrUpweTj328cp7G1Tu66UT4CIZ+/iFBqCdvfU=;
        b=Ubup8JltmHrEN7N6ugKTVnxPV+ntjeQ3B28tMs98/4naTV0EMk+ZKOPM8KqHJgdWtC
         rYzygckNdQyelVqYOHC9B4vvd0kRuAMm8IrjB9DEcUVqLurdGdZY8v3z9qFsWujO959I
         vxV/zcbRriKzh50FvgmPN7yTIC2iivFsW3/Ef7amq8I+06sh1DjIydfIA9X3W4Kj2TA/
         2LjV/1J+cmYhWfYDw2lLprYXtBA0/uC2jlLTHdWtugWd5oViVGqaNleUuSvDjOZfBGCy
         Nn0WmmXRz5Qscpupco5w8h73jRM+D1c6nj7uE9prkEvY0JSqhMh7yP9HIq2Kb8ZfzeYP
         4BQQ==
X-Gm-Message-State: AOJu0YwYxvPOM0+o07Nq/9ojlvUaak/sovS/5ZSfNExOdYMZcUpplE1x
	bYIuoH/lSuV63zLNCoHBxXqeC97MlwmtazXeNaMQTtLr/PNf7XJhJd0cfWalDnyYafKC793X1jp
	Jc6VVn8naVDwE3+Hl+I7w7UercTMVPTeMTSiJgxnSb7yt+EMUCld/F52y01K+41p4n4ledkO/zA
	Vwy5c=
X-Gm-Gg: Acq92OEQ48klQW92TtxjzA3aJNwUVvW60kA1nsCgWESyqx2RaUVtTNkkCUT5JtV/Lb/
	kVusI0pz2qw9v/F6snlx2pak6KR4/XkMFwsIUKgRhROYHLYtXS0+pqUCGMg/8u694KzJzNTudGZ
	h1xaATkCgZHsR4nleMo970WMk8kZ6NfTrwIGzvH+zUTJIEfJ3lXz00rfY5u1kw8c4mizol2PdhK
	EJ/2TtADm/+P7oJ6I5rwiC+lnGMei5m7CaFHXkEIg91eXpn1FKMuwgstRkK8+qYqif9v8jUnkhQ
	/9jRUL+KUsE+3X9Dk10P333JGUJ9QI2NJ0Em0KoZXLl95Yz6wQtbG/bnsQMYZHny957baN3469l
	ehoHdMNxIdeZrdHX1zcsV8WDhUEZFLwnLSM6T5uTDDboldsk+q34Nx020ZqwC
X-Received: by 2002:a05:622a:178f:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517ee26b1ccmr35463921cf.54.1781180680051;
        Thu, 11 Jun 2026 05:24:40 -0700 (PDT)
X-Received: by 2002:a05:622a:178f:b0:517:c38c:74b2 with SMTP id d75a77b69052e-517ee26b1ccmr35463321cf.54.1781180679563;
        Thu, 11 Jun 2026 05:24:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e47a9284sm39963185e9.1.2026.06.11.05.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:24:37 -0700 (PDT)
Message-ID: <f9d9c630-50fb-4491-921c-0c296ec9922f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:24:36 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260611111232.EF6541F00893@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260611111232.EF6541F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX07ujq3ut0sob
 ftz22VlJanIcVxh5fXwNy5bihtLY0hx6XxBiRMYkNfd4rsZJoa1jPkOMOpygbxmaDe+hZFkidqq
 xfdMEtqo+h+smJMydDMZMXCedN7TESG4NBGNIc6qgot7Kc+/uv5NJ/vwQtjR22VgFzXgam1lF+F
 LZGyK9fEbVXA3voDUN1iq6/HQCgvyDNW7D+eycaqRGIkEWDEqyKftb3UbheNsBujq5VHEaesYzp
 3/uMWxacVPLOjadIWnf2hmZwKeIZwQ6iFM+GygYm4u3RQzuiA2oWOEgQjGld49IZgaJMLNtroLj
 jO2ojd/Z0fIImQ5l427ImtiZ/rn5suSQwJDy8tC0ZLlJnHLrxnCs6BlBMO2z3UnKDgbnk8J7rx2
 Rb5Yvh2L9gptpBVkENd8/K8ymBNneHNdhAgXMyhfhOx8tOkowQqdlcCfu3vVYttgmT1RWu2e3J7
 ovnG89/nPLKKmp89lrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX9pi6G2KCCpeg
 2HRVRKTE/rrZrPE8jSCCjYZxnjadjAO67R9APA/Fk2O7lcPoQ/os860b4/HXEkpQg26z9Gwnite
 quszZQacJy9GP57ada3ibB2L2rKdAGE=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2aa909 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=GKwtICyI_p2dLrIBI0YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UNsEf4RM4qJdDOWft5BgYf4JH6kDeDT6
X-Proofpoint-GUID: UNsEf4RM4qJdDOWft5BgYf4JH6kDeDT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110125

On 11/06/2026 13:12, sashiko-bot@kernel.org wrote:
>>  
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
> [ ... ]
>> +    oneOf:
>> +      - items:
>> +          - enum:
> [ ... ]
>> +              - qcom,pmiv0104-gpio
>> +              - qcom,pmk8350-gpio
>> +              - qcom,pmk7750-gpio
> 
> [Severity: Medium]
> Since qcom,pmk7750-gpio is added here to the standalone enum list, won't
> standalone usage bypass the generation-specific constraints (such as the
> gpio-line-names limit) defined in the allOf conditional block for the
> PMK8550 generation?

I should have removed pmk7750 here :(

Oh, I hate these YAML block re-indentations.

Best regards,
Krzysztof
