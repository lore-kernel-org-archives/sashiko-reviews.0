Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7247411FA8
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492282; cv=none; b=gygFfYWoZ6nig/Ofo5uvfAz2lEh/vBxXI/B74+YVsqyNHv6y8ZxSDA+3fyA4VCg/Lqudb/JF4gvZbE4csipg8bnZzStzugEXA6W39/hTJgP45eckd3BQqwJUSeNbrxOUVp+0iLwaB1hplCNNZ/kE9jgNePzTEb+lX5vA3ioT4Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492282; c=relaxed/simple;
	bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkjVSBakk8pEZ7r/70zRnyqpOXFEowSzfYR46CwvbZk0i0pXxN4H1WHYb0wb9a4pJMFc5NuoPNsPKgIZQ1UKaCV5OJDxDpSu1gxzZ/Knn0s8EzOQYeHjbPAFVnA3rgb6SrT4Ik/4ZuJMz49wUJdkHtoUMBtRJSOTrs9w/0ggITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyAI4MaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B032YNdh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyAI4MaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B032YNdh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAWcI4060933
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=; b=ZyAI4MaYtgkMRrHS
	EBVKJVodE7DhKHks+AuyWAv0rnX/WkqonGXkHcCMcmWXp/UsxcMvfQ5u0gU0nKvq
	PGxkm7EOUcemZTG6zmqrUncVRYFRwujRPRuwNMW5qOOny07jQttSyGq3ozPhd8uA
	s1jAhA4Bb3gYF7U2D2ollYUiCjUNDVIX4GIVydOhjItbGf611TZIcYLylGVZgudR
	ztsb1evrE+nY7T91XPQX0di6R8UQ88lO1XAuxSBU4+jn9Oy7cAH9mWP6sVOrGBzs
	IXxFVeE9tr9M6rZrIqeFg5IMKgotdMkuJOF6ajE2MUowIhEKjbja0gRmIOQ+7u5S
	wErGOQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e27a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 17:11:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c98e907506so831923e0c.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492278; x=1790097078; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
        b=B032YNdhv1mY/0Hs5N89XLjZzMHQm03TRxPjBBhrSc9sp0CiypFFP/Jb8KMBhmU4xN
         Qj/3DGryLDgYmRIA+s3dG6ZIfA5hyZnucuoZjzG3pYY6dxkvfcr1Quz2iaAIRVNq/6ot
         ZZMIvYurAn4+N1hFT4hd2+Y+X8tzBHkAPY13HstPizulTdtONJSegimyTWdRHFbPjOLZ
         W84AvH+y8ZogEkSA+zbwp9sKUvMyxii0WWpjhyu/b0F6Y/8ttRkNlPJ3W5Y/dvNHQufH
         dh3T9SIo8GuLagnrNn9kxd2+wS1DS3fhJVqdlDKOuPwI/WJOUYpdAZK7uspk070RvHRn
         4dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492278; x=1790097078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
        b=vpZSdVuXiK9nOMSVNIlYDdnhVASfWCPNd9KN/qd6+WzI/8JWuH0eoOgdYcMVDdH9NH
         Vzr8mEvtXUky4n4ZerWkhT8RxPM5tGTLitXI9cvvmxUi24a2pt+8VT+tzBRZAvDF/Kzr
         /Gw1OvbBtbmCkOKW3Y0bYtbVRnoCq3sE4S48+mA1T04nT2t2E/r7NhC069/WmK0ntTf6
         5fSHxJtfCHRAXkSc8DWrTFB+q6zCEo308Cxyd4V6kdYcjE9xOb4s6XVqoLQIepc4Ex0Q
         QurECcbwUDIznjQQm5HZK8lSTOWlodVcGaDTHSMfcwXEjRj3n1BXIRfhosVrnGANBv4Z
         IP5A==
X-Gm-Message-State: AFuF++l2QgoHeK8prhW68jhZjZADgCeQbKBKEoXeYRnXiIBwySkMT3t7
	hXfTXmVv3UFItiOxzg8oxrQRZ2FgNNA8FswLjNTo2Ehz7A8+nDeBDX/tiQNVzxlVDiS/yBwcbHl
	5ahwvPKgTnwCzsYrSlU/MshbNP3qJteuS39QPxhfajeN+eu1kBKFC9q5E4iF5JgfuO7q9RNjZND
	ga3OE=
X-Gm-Gg: AYBFou0Eu0xQQocfp3gviFqu4a8AfEESW72MUI1fWI1yWgZ+V5s1+07C73wnCFm2UtT
	8pe6AgBLUtTfv1j3TnhcLqyIqZWr8/9zOom7MYPWY9VbA5Thlu3X8dn9desku3zGmILMC6PC2QS
	rfZV7lxBEOV7W/6vLZ3tyC2ncsYGnux1itSS/RL8IuITjFBlZcYhlbFFbHJRaN0qujOLWBakMSs
	4/acKa2mZ+JNcH5YRFWimcAGo+nnjVlwOjbW635rXM58LSVDMWK4d99A2Q1Gelfbn5Do4zdaCQT
	k7st2Oi/kY4Wz1w341LkRi2NfHoZGC2hutHuzfU5SOQ7YYJqvY4ilYAJ9YA650GMGBFwuwCtqM+
	2Bq5qtOG0XIfRlZTofW1TXTwtUlip
X-Received: by 2002:a05:6122:6202:b0:5c8:38b8:44a0 with SMTP id 71dfb90a1353d-5c98a4ff79bmr3060914e0c.8.1789492278075;
        Tue, 15 Sep 2026 10:11:18 -0700 (PDT)
X-Received: by 2002:a05:6122:6202:b0:5c8:38b8:44a0 with SMTP id 71dfb90a1353d-5c98a4ff79bmr3060884e0c.8.1789492277694;
        Tue, 15 Sep 2026 10:11:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33d93sm388957f8f.22.2026.09.15.10.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:11:16 -0700 (PDT)
Message-ID: <0649121c-7c11-4264-8caf-c7cab74b3adb@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:11:15 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        wsa+renesas@sang-engineering.com
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260915155703.0DA831F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915155703.0DA831F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P-7jcdGNpXV8bQohhmANPGfJk8ACaqvW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MCBTYWx0ZWRfX3xR1Y8WNip1Y
 XyR5c2GND17E2wHl9otgc2+vhMYwEo7JXG/rq5WCgPi5DmnVC1yeWFBVngsAq9oOwtWMV0Eu0Es
 foH8ThSZuNShWCh2udmfHjxUAP8jc3U=
X-Proofpoint-ORIG-GUID: P-7jcdGNpXV8bQohhmANPGfJk8ACaqvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MCBTYWx0ZWRfX/weMC8AwRVga
 INmMOF5vUoknW+pNB3zTXf8JQLGrQ8bkPR20Qjh48IFSX2xk8BRyP1SAvTwCovyBqODfPMf9V0A
 3TUQhslBSXdik3F1lw87PRtOoz0kMLkoyt+9bU/xi1zRX14LThJucMpI0I1My8O9s8GCDWQWNLj
 wAHbm5zcJ1m44zrGrzukfWwYX/VVm4X5IZ32cnrKjaGU9Q+2CHaka6Qlgj6TbM4P0kiXXBIpKw2
 vLFg40WUSBRdVx1NC0C1vUSVKjwqbpETE6fVUpGczEoGlbl4IlXtnla2AJ/b12WIBRjbbAUHN6h
 8V9U9EWxNK/2+TtjH6U7L1Syh6yLN4XntCdTe33P3yIteZNHi5Kglw3dUS87iGBXXcAB3r3jsmt
 oDjZwqxXBhV3dNUib7Qo1RrY5NMQhKb4gMBpwTfoi2ZPWMkqKt4kv87SkYkOuneu7NqpdHtyHwk
 Aplosketn71ZxV5vNIQ==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa97c37 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=jGgFg-Djq2gQTLHCcCEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150250

On 15/09/2026 17:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Removing the mdio node in the cortina,gemini-ethernet.yaml example leaves dangling phandle references to &phy0 and &phy1, which causes a build failure during dt_binding_check.

As usual for other such comments: hallucination.

Best regards,
Krzysztof
