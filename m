Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003835;
	b=WTcuSU6VnaRnRsPBCvmfS6NLo19ehaO/S+Id0UdBofqiR+oi/R9LrCSP+hZtIcwUwLG1
	 jcljVOkOdQph32MxxHQtu4uZxvuncsO8C5WbCxLPx6Qqk41ZEFjRsY18I1OeD+//M+ERF
	 FyOZs6FT7+xMxxx3kIC173Fdaau3HpL27/kM68kDga4TUgnaW1wjgB4LCQgtSmVYHbjov
	 btQFfg+ugJ9Buo3lKMA8WWbSsd04sE+bpDXz6P73VN8apXox8xYC9RP++cAzAqrV71j7k
	 ywcHP2EO5i6J2zjzGpJp3CtTmcfL7O8A6dZ+zmtQ3CWNFkBt0o8oCsJ6jqlx3ud1apA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
	b=U/rldBXn78qRj/FyCoAAUvzCcBUCFkCwwDK5FmK3sFP5DaVAj4kdr8gz5EPqew2bwYEs
	 OXKkE2P//E3EXWPE4l2mlFyZQlgEaX/vywxsph+itm3xZqglQFNOjX+nnzuQHl94LTsqv
	 UWP5s4s6VZFTbO7lusMdwDw05rOAvYNFUdfBB6TXUuLk/imYJk4BO2/dCQbZ357L2PbPS
	 u0s1/cVVTE9mavFnGL6/hGVoG9JzQyn4hPMLLziP0ke0SG+2pliTgCPxFd1Im1nt8CFYl
	 kZ7RRVhaN3HS4J1YaUCeXE5saovdhM+eDB5+bHUJwn8IrC68zMwtX8WUJGeIn/FgZ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvWQeN6U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB21606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB21606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7SVckrU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BvWQeN6U
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIC5jBG3268948
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=; b=g7SVckrU+lSN7YUl
	hx77qvMUjExSw1YFXAMgAjwwKky3QRqTzg6hL9K4pmLl86PqSxL1SQWFgA+9otUy
	sipuafSdbdphZEkzA0h3f6X4bIsbPL1xCf+blh9+jaT2K691qdFuMLQ5cRmAV3JJ
	6mU0qjgVluFtpL5+v6FIJ3t2H193ky9UC4eIXZxJRN8K36qKXFd7uq2N5RA2wcol
	20cw8raBGWOxXYs6Fs1Gw0aT1QjsXmUoGZrqXe5otjj5GzCQ1EciYxJ6MJk0y8uK
	J0NjR3d3qSUo2QQ+BEMYg9h+lvL99eilKQSV1f4PApOg5GqOoCFxD5pG96zPWoyQ
	JlPkVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8jxdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 12:10:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bb7f70b06so34573291cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 04:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003833; x=1795608633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=BvWQeN6UYAjg8H2J818+ni6JIOOJ8JEqGJXlBWw2+rw6sMlhC5pdaCiufWkFw7oqek
         L4p5i6kpAww0aLJJv2vK7uMZfUvSm3NwG3bYF+rc+NWnf56dqVoCN/xRREuTipUdBm8h
         XupVE7ShLNtavnIKHXJy1OqDsRDVzUMWDqY8bVLQX5K5MsEGyipjxsQoQF2YI5vL9T0z
         VnPO5JDoEsWQxafhhAu+rtBBM1e7fDPSGnCT2E5kLeZPIIG2UORC6p7R7N4zWGDMSmd4
         xkyHPlrFqQvLje5Fx0igPo1bWoNT+hhGqeB6HJ9mx6ttRRHvB5Ii9iss6NgpaKISz05L
         qZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003833; x=1795608633;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u4NVmkar/A8uwiL+0DU4S6fSyFsDYEbwxSKbDfhHfI=;
        b=hKHBGxn9v+nzNTW3PZtnn8TfCXh78cB1UenDWsyHLRIXIn4amXOhGr/SN/ltQrvBBr
         t7CrJDdXsNkcty9u1RA1gf4GEYErUD4DiGkaGrPw87EiWCNuo+tKBhQ35Rnz24rrc2PT
         QHvwW2cifwKfNhNWJXQgR9NIJfQ6G3d5HMzaGVe0mAGubd2StKBK5bWN03XiW1HCS9jM
         4TcFTpF8oT6fp20hqGXFptHIb8yaDaTuchML+088N7zV8VzlMFmRRUuL8jeYUKR3Plbm
         WvCg+yMETyjEhiK/prHNBYoCGDUHTTH2KE/YjpWRQ17unmnTVu5SoRbfOxzbPEPbKzjc
         WzDw==
X-Gm-Message-State: APuU4Z+z0f3pbmcCrdE2ga9Sg/FrRr7n8oDkPK/9ZxpFIUM3FqT3fgYZ
	hYcC2xmzs9cHeJLcWzBV2Hcz/2TZ2Ron057bX09daJC40JB16SW1ailx9DlKi4M8XHicfUMilsg
	PQdN+83UHdpmkle76jLv6O5VYdx7kDHxIh7MaMpVqeRqJHuqRWqmo3ZC+HfJkRutZN1xPzU3Mo1
	CSkMA=
X-Gm-Gg: AYBFou2fd0Ih6SH/f9sxAPPBRF4hC7Jid8QJlATgRvpari9fHqoN/YW1NvKHe5IyxhK
	tlsU956wruLh9lKPDtfl155GOWFan2k94Tvf/zCVvB1NrsCdS+Ls6UApD55dmG2aPO0SYFZsVkO
	wn7i8BJ2QWPBLYvTw2h2gLcgwHXwANMMTTXoR/4G7dYwaYhgb5XyjVTqxPetmIgC0LMKEuPnG/Q
	A68MgiyK1OBtKgllk/wPYLm3dDPe/5ESa4t0JS6+3QL34SnSAXQI6GtrggTqwrVdxPSQw8/CDCz
	z6FlCbmhC3wws4MBarRYTx0hcczASZQHmIm9e6qEMnSvpEwRGBxosfdhV9qLg5MRwj/y15XyQ2r
	qm6E5ozSCnbMCFHTe8cHDm8ldalFW5v+gLMZNOiQ3cAK7YtmMd1PoQKEU1cm3bxaXCb10LO27Ty
	A=
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959801cf.32.1795003833348;
        Wed, 18 Nov 2026 04:10:33 -0800 (PST)
X-Received: by 2002:a05:622a:5c16:b0:536:540f:2ac with SMTP id d75a77b69052e-55d495308c3mr80959421cf.32.1795003832861;
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63826885e9.0.2026.11.18.04.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:10:32 -0800 (PST)
Message-ID: <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:10:30 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
To: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
        devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218903@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FGCDZS-7qQmWwatEt4IGXmv-7rDjWh1B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXwvIRfrtzPgyD
 sQN7/vzsAKVUTsfi9yD6P07WATED4s31Zj1/GLd55K6mT52dCMTJBVN9s1B0Kc9IYvakGu9XIn3
 LYs4QtDqaJHsru1TkE+t+c9YOvkhttM=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd95b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=nKi3LhNZ2G6YK9Nm_qEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX1Cvbn3JLKZYU
 J7wAmfiObdeLwDaUcXhmz/QYjbsg56sWDq74/1yC+jjsKbw4ziHhGyJuSfatZ+QiVJ1F4COD6h4
 XHo9SUNs2J2r+gF3o7TGap4vv122gvw+7gh2bSghr4vFEpUAqAU1r4bcYxueQw3DxUVxdm0EWUJ
 tRKq0QWzePObjqwZ4rZ/C6C16cOQTWAr8Z+3fpUUm+y32KzhcgHF7WoToZbqGDGhWdCHU7D2lnw
 ZM0VBa8g2997WyOwBqPot8R95AeksXvCM/3TRN53ZO3uolC9dESuUVGCH4+0kNR+PMccKG+JwwV
 vxP1ZCDOkZkInaYGCqric47q5EWxqOausY9VIKFdrXx1z+ok25+P8oVW6D4Tmu1/4gccWaFHhZY
 4LOIjq0RLYOOA5GYM3p/QsAsk8Hn3GIZbg0RHVKJQNxEi5ZQcBUpBUWs7I7Nn6dNQr/2AQQBauq
 wSONLajDfB+doqWE9iA==
X-Proofpoint-ORIG-GUID: FGCDZS-7qQmWwatEt4IGXmv-7rDjWh1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180048

On 17/11/2026 14:47, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: imx8q: removing vpu-core aliases breaks
>   vpu_core_probe()

That's intentional. Users should not add undocumented ABI and rely on that.

Best regards,
Krzysztof
