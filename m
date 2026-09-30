Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F44D37B9
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772910; cv=none; b=DKrwxX/vfm2S8+oz8PE1h6hoa7KDT7cwwJssNcQDyyWxuH1gd2871GCRHX+3gRai9HLt2rJHIvieKXGEM/trg+x119XSdY8iNVzFdSXeAeRXdmp/WmcwlqEeqQOKRu1WWGPlio1NNoMsN52PK1X9PZxIzvMvpmsO4n4pTzDdSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772910; c=relaxed/simple;
	bh=Ic2qFMQrtdHrOuKTgXc60cQIRArJ0xNCZDGOG5y3oPg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KVW0s3IMTdWJha7WaOOIi6sTXdlhbtsf6BIo7to48uubLapEgyo7URs8W+eZLAK+lRFfaYhasWpjgX1els5A5FwEzrd/fjFr+LugOE7M9RhxAh7WOZRwbV2VJ4BmDsX0TgFR27VBNtJk1TwkLcM4N29g4TKQq6FI1q8tnFE7GLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGIe3Y/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OocTHIst; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGIe3Y/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OocTHIst"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hwg2584050
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=; b=SGIe3Y/DDCRBVqYc
	JpH2YrZwzYxYZxozDGA7bo9hvjBKS0a8+yTiS4xzc++gFhYhiKnr1tNZUyqqPjlM
	e9Jf/cOQeOnaUK05aWXBM6Coq/iWqJrPvKXIpwKfxcYPy0jWxk+HJ16IQENPwlWK
	IvQK6gV0ilYZ6rvAQODxQ9flTnqn/3ZPzQz0AYG0kvDIG6e55XDckUnZs4WpPkQb
	kwu9B2nULaLssVGa7NYNsiUpN+1tDQLBVLQfsygEV8+CXb9gSSgD7nKArTuApd3q
	WwSBy3FUUckHcOCkeHBEcg+a3OWMJC5NIb7Kihcz+2a0EAjX/Py5R8RJR+SJallM
	8mwkMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhejvwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:55:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1686390a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772899; x=1791377699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=;
        b=OocTHIstPosA261qdmfzlysiPCa90YkMDXZLnpOexOKY5qH5kCf0ML4ITrJIpGgL5z
         hr19uSXlfqIDGuQz3NlXBUy7m0qDvUJm/Xo+8euciFR4T+LRMU9k3iE/nn+nFvQAzXrV
         LT932pnmczZ96WKIXhS0DKjJqo92JASkQm7GrFNm97FwfX+iSx7muPOn7StoKYZZkHNv
         EKTYY5k5g4dv5BiXxqH2lt2JpcX0siHArH8ie2YJdxHzKSs4uF9dV87DyvBMcKJBGNNI
         sYQz0JBkhpCniRcUHOEsK7fbDyQRTQrzdOiha1Mu2nkk16jIRw+PFo7zqON4wGusCyoy
         KJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772899; x=1791377699;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=;
        b=hnW9UdnXk5v4Ri3eJuGrXgKwBHCHlEXfu6MKr/fX+6h9oihL3Jsf4UShgwMERHDF1x
         L8ZtD+i1G4tS2t3x/x0D7zX9WS/VGVoqyc3fJ7/l3G/Hr2jVEIEifBTFBTcHJXkyKO9R
         nLt9WMJPf7HfWQPllENv4DK/nEb2yaeYQKkPmKpgKj9LZpTgmFwC9Im2M8lYzB36zcV2
         3P3+/6tHMnPZyLA4ANysbx2fTDU5ZbyIZFrEAPsg9+DIX3g8YMoYiTgweDYbPynZTzin
         /wKv3Jz40VfzySgvn9N6zKAMmDRGZtgz9HpLlGP2b7ptdJjJ2IgGG5Yf/F7TlSDy3lTJ
         rNFA==
X-Gm-Message-State: AFq9FYJVvLN3P792lqT/At6ZDVf/OrjN6xwgPwP5BDJV8bvujWEoUYbW
	MA7Gr+CSUtdmc+3kHCpuHKOAwZlrMvvsSbz9dZLG5ZTCpRIITNHkXgs/U1y5SVFhNWmtRrN8DTE
	zFsERsnpc4z977q/1XdXi/z+P41jxCKxI+S/TbQ59wy/k1ir//Tl7j0378OgSP6Exz1joTDIJPB
	PO3X4=
X-Gm-Gg: AYBFou0Xb0vfw5LkzTqM0GMfTVoe7HNYmVkpue2Jnj+7XXTw9+TDJa5WJsaeF2t4Wdq
	a4zSfQCgRvLb1bDsLQz53ygvKML2xLqboVyYXYtTihJhDxZcnZBVpXKdQqi1KRXcWrxcBqhE867
	j+IosVBIYE1YprRulJWES6IPwzgSUcLwbVEoBrmbtiQ1tFXyP12pDD5Ynu7JdKcNK9tA1vR5L1T
	QttRBPzd+XxOgtW/YaHCLrvGMKsVLDTOK/+t6oQj94+oSlkLfwNJclxVwyWKpMXmIiLtiZVhq9O
	wpsbJqcfIzK9rhcZC1vetmo3f27LHDxMwQvQkB8JWbVqDfiK67fZ45kopfow6v+rSAkj15g9k3H
	ryWmJ1a7X1IVfU9G9ZA38LS76DH4RrtQYx8cr1/MbUVX+ZLPTIqLfntf7Yv4g+E8=
X-Received: by 2002:a17:90b:4d05:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4d276edf1mr763360a91.13.1790772899324;
        Wed, 30 Sep 2026 05:54:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4d05:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4d276edf1mr763347a91.13.1790772898774;
        Wed, 30 Sep 2026 05:54:58 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm3270351a91.9.2026.09.30.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:54:58 -0700 (PDT)
Message-ID: <04f98e0b-e54f-4641-8a07-eea7a998c2b1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 20:54:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: Re: [PATCH v17 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: sashiko-reviews@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, media-ci@linuxtv.org,
        vkoul@kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>
 <20260929060809.5DBA61F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260929060809.5DBA61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YVrrtNb2rS0KEA0yZqi4mv0UOwIb0xyW
X-Proofpoint-ORIG-GUID: YVrrtNb2rS0KEA0yZqi4mv0UOwIb0xyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX2WpwDmKICs5J
 g/peRA7rzgIVt73nHbTp9SLAmRVr1CotAPtiNREcrxndreSAHSrYg3jPIPdKEG0k2HMIPGzpAFP
 HG+y5fPihs6WkN8ff+SgW3bTpRbl9L4Vq1I0tnF9Vbd5qj1Y+iMyNO11XCqq6IQ60zbpcWkpD6L
 SmsL0XFp37SPev8Rbaq+Cjiwz+4z+MvPwdi3hYKNUlDxoXvALWkBhu9YvcQ1FkFLiwtkGeRIRY5
 L6LB0oucX66By+eb6bNo2mafnhpbRem0QJWkTqbS+wDTNhKVykFhEezqqkQ8iD/C8Pqpa2CEZTI
 7IcbPlousPv885Zp7h8zkI8mQ3ZOzig3ghqbJ6W0FvMcrKtoM31Jv3yIdx6+9MebQCvipVN0ege
 VYbCOSjy1eDWJgF5kAWsrz8vV9ImoiyarFBjqfN7JXhsaxp/ijepZkPxkh73OBMFuJlkDOlILUD
 24Jdz05gXHSyk5G7HHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX0N1dt4tqSkTn
 cKna49/hhC3FBxA/hTvxDmRV+mudFusa8HxRjNjltA2ogEVtPy2JlGbHiCe8lGQusAhVpscmE76
 MMmJZsSX1Dcdg7jtlakORFx2gKTTuEE=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd06a4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-qPLxJttfSs1q3B3DocA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051

On 9/29/2026 2:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] media: dt-bindings: contradictory port count description vs schema
> --
> 
> commit eaf675a1ac25eea3cc950df0432cfe59f97c1517
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: dt-bindings: Add CAMSS device for Kaanapali
> 
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 0000000000000..1f8b18517e13a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> [ ... ]
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports, one per CSID. Each port receives the CSI data
>> +      decoded by the matching CSIPHY.
>> +
>> +    patternProperties:
>> +      "^port@[0-5]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data from CSIPHY 0-5.
> 
> [Severity: Low]
> Could this description be updated to clarify the port count?
> 
> The commit message indicates the platform has 5 CSIDs (3 regular, 2 lite)
> and 6 CSIPHYs. The top-level description for the ports node states there is
> "one per CSID", which would imply 5 ports. However, the schema allows 6 ports
> ("^port@[0-5]$") and the nested description mentions receiving data from
> CSIPHY 0-5.
> 
> Does the "one per CSID" text need to be updated to match the hardware layout
> allowed by the schema?
> 

Exactly. It's reasonable to remove this misleading description "one per 
CSID". We control that one-to-one CSIPHY and CSID mapping manually and 
the real multiplexing result will be different.

Best Regards,
Hangxiang
