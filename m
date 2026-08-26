Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FBE2F7F1C
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734604; cv=none; b=ISS7RFaLOl23NeXwfq2U7rWuHWdhQX9G4LU3ewoG4AAeWAf85TZhk0gXVycIfJfEHQMKysmY7Mqnn8ftF9dz3JlAkM2XtjUdNOH67j4LXt+tRjBZs+z2gmCtMU3y/Hpj9yvc13x7KIMMDWoNCEHpRBaocgvjHH2BHSBJrpGtiMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734604; c=relaxed/simple;
	bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYUqz2YeOFTkujxHmWaGm+LQzIof83mJHrI489hg4wesalKiialbcUTrpCSe+GZCvGkWsE/pCn+92p2QEve4HMs8XOw5gJ6ds4j8NIuObfN2BWLlZTEU0tUboeIBb29EmSJxAGJRYyLXu6iHINgnSFa5ki4m/U0JasNtKjOlYXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBpek1qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B79iDiuB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBpek1qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B79iDiuB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rf8P3689278
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=; b=jBpek1qeAZWdCa53
	aIujl7BvpeMGoLdiuM2HcTYSKGiLw+nAhMrYS0oHyG9BvbJY9rrTgxrP0ChznGd2
	2hFg576X02oUKPHm0+WgjW/8PIzBFYDt7+Jq+b3qZawhNsaosuGrXXt7o3s4mdW+
	DPg9SsPsnm49Ha9kxg+YTrv3GJRVi13aWROwyERwHcnKhfCVavQ0Gl+pxEpDo0KY
	nvTkoHycx48KnuOw8k6dXfuFcUuhUsCnwIP5nWw4IzBZHqTv5OVw9lmagKxWthwS
	4HCVVnMlMKFCxwovTZhzKXuiG7SNMylApuhiJCBarzhPybDUO/Q4KMDFl1Mjv9O2
	saGLNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn31wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 08:56:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so7154681cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734602; x=1788339402; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
        b=B79iDiuBDQulhiO6fTdaAVHWHV6wS9fgC7IdRZ7hevU6R5n+3wLwRn1DmWqrPox0uY
         kkeG9u1IGAOdr9gZIzElNCzix5CueFGpVYFbPrHfnhf1jACgaSLPkdDc/TOm9QA7dZHP
         2KuuROI6ozs+2pSL4UFSirRJekcpa65ktS3u88LvviuyOfSdyJ7Kf2+lTLPuZbhdOPZz
         YjzD0hv0bwTC87/bHmXbD6JuJ4+Q0nOcPWLOSqI82gjnp4/1h/Xico3HEP2MJotu5KVn
         AldeKvlZoemjhwbwMxDTJfFdgXtG1TyCqhyT42u7sNlnmh9I8nu5JAL0Tw7zeVvnW1WS
         DHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734602; x=1788339402;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
        b=GeDyfu1jMgUT9HgOGZQDUbnV82SIio/igjjpO9YR1OmuzSJD6nfDJAQA/oDWpPTWoj
         xfUHRyG9F1iRLrsy+gbD7ksTkrjihSWJYQkwU/IYkeViDIg9BFt3IEEO7+kS5wQiLQLs
         ALfubhXJlAnEO5VrdRRNAu5pcSbuz6mlWCw7nU+G3jk56Wkw2F1JYJ5oTZrzDgxUYhLz
         tgnar30zfh3rNOFsMNHQwhtNxHFnELXaxABcCmb4lmeXJhlJyHuZglyv8+UJ79bxu1mj
         LoKZWyXh1ufahS5Mgc4b0Ki6Ov2rgxYwwZmk5/vaNrPboFbl6qGDMncMso4rkXX0sPXE
         pZNQ==
X-Gm-Message-State: AFuF++llU4pBFHoPdX9i6PEUv9QN0V5iB23sluWKOxHsHtSr4ycCZ5Rf
	vMSySPJTkrHOv9q4DoZ8Mns6p4TRBpL/kg4bS97I1JQ/e8Bxurx7p7uBD0gT8RTtixwfrIhU10Y
	nV1IZHbTOMiJRB05krla/nHA3oAuwb/oejv/+DQyuoKnmMalJQUAj6k0LeIEYyn9lQd1w6lcVaj
	XTWi4=
X-Gm-Gg: AR+sD11iqZ8K3pt9jljbG66bXvIF5uKAlvRRCW88TSP7nP1swIUs/dOb2JBJIud8Af7
	PFdQf9iaimScfhDHTfWIBD2vN/qsm20ApbY1cCSSAkc3N5QZNDCygPEOVfNA7qZO35L9054HrEe
	yz4lFieaFNRhcLC0FmzINGH0MawvmKVGO75l6ttyk2vJqimEf1Lgq+cLfzUyjOD/CHhJfuzpTcR
	le2JsF9vkOgZS4NxIcK9YHeKxqn6bhHmiNMhzixC3YEnOxjE+IKiR5KlbGJoPkyC/Jg1aii+wJ6
	p7qg0FR2LkOoETUI5IPoW//aYwEXauf01l8HJ0Q90/OxUl4D5KrpVh2oBOogWOZUtd7wGvT4gNh
	qly6tZuisyFC5qHRnVKYcLshVTX7z
X-Received: by 2002:a05:622a:4d43:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52e2ec3ef5cmr141617831cf.6.1787734601739;
        Wed, 26 Aug 2026 01:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52e2ec3ef5cmr141617641cf.6.1787734601351;
        Wed, 26 Aug 2026 01:56:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deae5064sm3859894a12.27.2026.08.26.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:56:40 -0700 (PDT)
Message-ID: <bce242d1-de57-444a-a1b6-93a941372f01@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:56:39 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-9-022e60091965@oss.qualcomm.com>
 <20260826071827.867DF1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826071827.867DF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QYNbk4RafPGIGhIgpLfRoLATho80Wj4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX6OJeTKWB2cje
 971zV6SMInhjXh5OqK0qNfaSxmEKKxyQQYDCHMKuc/FTSXGGujL/XJU745G5TTo042Gbikb2hQr
 2Dp7zQ5qXrq0w3FefDlDsOeSR8JAWnY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX9VFh5tv2j24J
 SEh1TpWtDkQbI47qaFObMRi7a9R+qNWgl0plhyszCUSu7LSSTiVzCyjYgyzqWkPFiNJs4Pa1eCT
 0DA1Ifpky36SrknD8vNRImAGVWDF/pnAB9bd2JAqUGtH5ZGiVTX++jNle964x0mBuViWRbp44s+
 YQgynbmX29TzSAwZIVExZ6ozXROWZh5vhRuQ00LdLjg4BIGw1URNCo/CjHkAdtdGwAZZF86vZJ2
 80EJXj7uUN7M72sr5YMsuTKgc5KOse8PykYbyFFGiDzOQHRsCzELozuZs8tLQxMsTFCxJebHv+3
 AEHJf4tNpynuiZxG/8pok5KWj/M+hQjlp83xXBK7cziBNVXi9vdzKFi7mxK4LrRE/i+CQ+lSYY/
 qwqeoCNw3b5cRjOc5oXPCB0aeT1oqcbKwRHD7TgrbSJVC0yCEHNMOfRwCpKcz7KDyMHlR8eKbSh
 3krqGNvtVW+VWcWbhTA==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8eaa4a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=6GxiE0gnHNR00cM43ywA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: QYNbk4RafPGIGhIgpLfRoLATho80Wj4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

On 26/08/2026 09:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The regular expression `r'(\s\s+|\t){'` uses an unescaped `{` character immediately after a capturing group. In Python 3.11+, the `re` module enforces strict parsing and treats this as a malformed repetition operator, raising `re.error`. This unconditionally crashes the `dt-check-style` script upon execution.

Ack

> - [Low] The redundant whitespace checks do not validate continuation lines of multi-line properties, causing them to silently miss styling violations.

Ack


Best regards,
Krzysztof
