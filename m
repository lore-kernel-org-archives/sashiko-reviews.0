Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922888;
	b=YJOn/FBGLJt7nvMp8QpFEAP4HsDm3immFD70AxjY4f3C3NrW5qN6oqwjUQUsDJX71fBZ
	 ZP7WD7LlUNBvx45mjK/PmzkNzhc/ldjarB6X9enz5fFDqGOmUjtAy4frbsP2jGh9cA2BP
	 B5sIlg+59kv711op+p0A9hIfx53i9RwLS3Euhkk8sv/Lq5tDxRAgis3+t7MFNaFd/PA3C
	 dz4DWDzgQap8WGXk8JC8zW6Pi8mIuO5vfU/n3Zxl4GiD+fSh0c9nlmO1Oy15B4+oF09VG
	 n6nSKQdNBTs5NM7WufcdK2nWWire6MP2uZANIqXXzxNDNIkvEzvHWJ0Vyus1wZxdv7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
	b=l7Dj9/5aC55uUScIlD91+d4LZWpO+bgJletyhkBb5P4fl+2eJjbcCfXOM8oaWBCzztrU
	 dJAZ+xieLL3vkZuIsUNTDij8IMcIhbSb/r056lDH0GynOstYPT5VKJ/CJcLxIITOgULBg
	 8IEBV/kVY17vdOB0jPavV1NzFjhKtTouupS/pztNsUubhvMZwP9r0PhOVyjN5Q7ciNCAM
	 sNpRfE00LfKgrKEaBZ20sIG2bHX9asckvxQF/X8UM4Yrhsbr9GYO8S91Tp2gHjALDeZ6w
	 o+UXFPbS8pct3PQJ2Fr8jFJ+KVq6x5/ykF/wfLQzSsfaXYPctF+VqKqZ7D3bWkcpYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Thxja5bN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORQBWRjq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF94606A33E
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF94606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Thxja5bN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ORQBWRjq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0qiu1208460
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=; b=Thxja5bN+IrDwn/P
	0yeFS8ECitVmFyzMPsB2WIBDbpGTKL7mhkgldtIU0EUOpXIv/PMcEzuOKxe93Nzy
	8l0rh2wNxKIbX1r+w2Ym7oLms/ioifJS+1Y0nis4DNCNE0nvPk/UIyBZKERa30u4
	4KoGhA3g6sXKGyGLEi2C8/82vkgZ6swPJhonIhC97J2fkRSQ1VFOOz9zesmeooa/
	htADpDf7FOt0qMw6YEaNBR1P9ymlXbhOsJ5+o0pkR8miQ8ihFSLEAGY8uSdkmWgr
	yTOee4oQHjD2c75Q35ecBsbQcm/rTY85isBgZdKxGdZVVwHD+uXKgY8u0t/m5jXl
	Qb+n1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc96uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:41:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2e7fa9fbbso596752137.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922886; x=1795527686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
        b=ORQBWRjqGI5nGJ1ss7X12EalMKBKBtFckxGs+9fHdnjg5SwyfIBd4u1sz12pNmCw7i
         EKZjSy05TX/5TLoMAZ6dnbUbBRJAEUZCi61PEytMreKBxHZR8UJU+sqeKsH/40DeO2kd
         8A1k3QIEACBZwmhy7zsl5S1dYKJXkzZTiwMfV6XJJ6a3GLBAUOoqUne1tE35lCg3dx39
         fnGQOYk+IpXsVtnIIzgFh1A5zF7x7srMwbY65yIE7AQb0hd7fQcSy1/7T2Jcfft/4ehB
         Xa49fpB3rQ4xBY2H+A2agt3SP/vnqRr68sH9XQzim87irtKlitURN2TQZY2dDzuU/iWW
         cwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922886; x=1795527686;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
        b=uBXRpDoOTPpFFR+v+fxqSYMaz9zEYy05hG3yC/LnVielaMTMNF1s/++Ckpnodnx48D
         t7yGFg78H30ziqGmewu0EDJP83go8jCnriONYmNgo3vs0VBKiG2qBINywNGPNZPiBvyO
         7q/fypUHFjm4+LQalHLqorg5HzXcDnxCTnAOGrUVZUZAD+l1NgUMLlYkE/u3Baqgi/LR
         9mnnGy8K5D1Hy43vuSaCg86nnizO+QukrUjR7z+Lrv7ttiI4jGWJdStRWdjuxAP8IS/O
         9srgYFGOUZELsy0Kw5F7B0Ka1g9fjkYZcnNua3JtNOHA37ZC387mzgJuR1HsDFNYXD2e
         e0Vg==
X-Gm-Message-State: APuU4Z9XRR2zvNTOMb4D3LeMnnenfzkj4GgeECWPindasDToFl69uUyn
	3PNSkV5Af+Reuczr8MlUBM4/oP0GZWIGQYg4YSUj40BVqYdNOFPrpx9htU/1zS014mnkjPXE973
	WVCvmk96K2GzPH8qisoPX2iAk49SOKjJ9ouj/A6aX2GUIS4NfNeDrzcbzK/SrPzXOpgDoA2GmGk
	99/pQ=
X-Gm-Gg: AYBFou0qyFc8Oi2GS3jP64kVdydFX8HEK95orHA3xF83rZYaluy3ev+WSyAk1trlKig
	4ZpY2yzqZobyUNAd0X7sjFbKc/65nstuQn36qLQSsf6IXcuwqnKvron0SfnQLGVYEhtAgXsz/+X
	iGaFbh8t5qUdzGVX6xRE1SIK+xUmjiR/0zNFVxQr2EOYslq/fVm9v7Q+RbomqFmEYesJaB61m9U
	RygD3WvtdYBC8+0uy0cvFLTT9r+ZOCOXVKigLiYAmzrsIpAXq3bd974GpUs22tKD5qy4GtJuEO+
	AShfamyUJ+mFzexayqRdafxiesSWI/tGb+ahC4uBkeWbVa83QqdBWaqYUP3Vb9KTWlkfR8KvBpf
	UFfkFySRCNs2k5oEQm7zYNl4SBjciibBTMwSqacammBKL1v/zqI8POqc4rhk83rTqjYj2eW2rDx
	Q=
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr681053137.34.1794922886573;
        Tue, 17 Nov 2026 05:41:26 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr681048137.34.1794922886186;
        Tue, 17 Nov 2026 05:41:26 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm84049275e9.2.2026.11.17.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:41:25 -0800 (PST)
Message-ID: <f35b802c-70c9-4f96-a5cc-158e22774769@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:41:24 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: apple: Remove undocumented, unapproved
 aliases
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218871@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218871@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX/t1j9IeBhtnB
 7iYH199uAVY46iujpg8H6GvxUiJtppfJkco+vI5pB0HdnmBHpo7vU479MLbHbmy1wa0cbinnzHu
 zrgsE54RYxjIWe3QWi/tPbC1K/foS+M=
X-Proofpoint-ORIG-GUID: 6ZL30qK3abcuwbtNx-3W7vK9pHgSxQJ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXzXJU8YWjfhTR
 NJuZC0CbrUY2pj+phG4FUPLpMvN2kJmDQwMb7QHs6D8J9gwC+v7xi0+L0w7MI4sJgsFKF6K17kV
 5XCO4nnQ62BmWzEeZwKlLv5je8FGgZzw6jpIW855Eg+OPrUSWIDuuK2raseQX4vgklgZY84WvRN
 otV+uNUpRSw3w6fFB10ODqgYD5ymSG/ZE6vncfBhPMjjk/mU/64s7xBMb/rU5A7KYFyrGs2wxUE
 J7ud4QHILQASvLFYzRBnoswNrZg6svfueA/SjOYKmz5br+nevTw5NCHxBcWOItJFfCP0RG/BY91
 8fItevWzf6A+HiHSpkyqJbFJuoLP0aMof2gdSATCuTVzZmwFuFP/8fhLP1TpulErQG6ou7FlBSW
 RuPifHKN0MAKSzid+cfyQaT5yzz7KgHT+yQZhl0Xw5zC+N47m3sIn3BgF5Wq/ckHFSYcc3rNa6t
 GBXxadDQssreftpA0sw==
X-Proofpoint-GUID: 6ZL30qK3abcuwbtNx-3W7vK9pHgSxQJ2
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc5987 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QxBoTKaGf9fV6qxcK5AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

On 17/11/2026 14:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: apple: removing aliases breaks atcphy_probe() and
>   Z2 calibration
> --

Life, you should not have add such undocumented ABI.

Best regards,
Krzysztof
