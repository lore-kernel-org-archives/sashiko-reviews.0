Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DED48A2A1
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102530; cv=none; b=j9shLxmWfdcm9S3+t4UZ6a95w3eKm5kvHj4kGg31Xr4JmQEuhDc9OZgVb509n78iliAWwkXXPZFtm8psLNHUbpPNLbiM3jAtD2/j7afDPb0fGfkg42yi1mq9meTEq/Xe7GjewZHPDjTbWJtkw3nTmwCl+Dp3AsRYW2XqpERLoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102530; c=relaxed/simple;
	bh=yRqYydSndchtTUcx/XMl6b0/WB3o87e1VH5mRwkGmUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsvTXtnLchewwWOOLJixTLLXlwyPmJtLYLXCQ2ClZP5r6V5fqhNAAKkydcrbZJAZo73OU+rFrdMWwfYmphvY4FPBl+WrSDYbXkc6bD5XW22ybIktLZfu6q/Lys0yTJM7GQ4lhU4/sjgh07r+8KTxBr63kuFGOsIA0VW+bvkCA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXGlD4YR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCNRRbJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXGlD4YR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCNRRbJp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Fvb368086
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=; b=KXGlD4YRDr5JgoV2
	gUQcnyXZ4cKcGj7zDXgXchV0ulGzZGcdlVt1NFBpcdc907X84b2d8TDWaUHJ7eXZ
	Az6g3dXTBoUAhAWUR0XYAv0t+PRnAE/W/dto5aqvRAJViaTnEHz/wCT7yoi/4jna
	+Lhr0ORgWszG/Ak+Ex9tvtC0KD0MUiE9fL6EX0tdIa/0h9XSoP4c7h4Mh8d24j5w
	uksQ191Auz4yHjJV98mrPGWNqDhly8GxSRilkmkXu+YwE9kbwhF9caj6i7Nor3kz
	p2zwVbQBJMLkEP9Jp+yrPgKE706fTwF+UfbKAtR8ZneuuZNUUh1LtSnIGyXjZhzZ
	8EIa6A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnta884-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:42:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso75383241.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102527; x=1790707327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=;
        b=eCNRRbJpQ+EGsVUh8La8idqwvQBE5WTGAmqjtYHMhqhaXPr+2m+g18xvQLpRXe7DzL
         wkm+ntZjM1EYe00s/u5vgtn/FO6IqReE3+Yg8nEZ9W4WZASLHuH8DfWoLolXZoSNJt/W
         njQeDdFWWKkxyII0eWppL/Z/M3BjsrECnVSnwIr0kHPZIGUSbK/byT+ntSJCDqZ74WZL
         UG3yod+cFIYaVNqWvrcUTeogRLXV1hO7PIR32yB6L6SNtcpfVIcH+TLItAjMAHqDNViD
         ZGYwk7PQl7B4yk/jRlFP8xumYf8tOttcnrb9Ud4obyOpYuztYG7CLffQ7t0TL0HwUiPr
         LGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102527; x=1790707327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPlTjTDG5Ok02LM/J+xRKeLvLBa+UcNx2c4ubRikRr4=;
        b=NVy1+SzFehDlGqizFdwnIpSAONp9nhJa6VJRCifRDB6LFb8O54ohA92BessNWzvQJ+
         TBnoE3qcZuAOWypgs2ePXBjg4Ar5uOet7/S0QdKzA7vB9JLdljIsqPtgCXJj04zyswBS
         0c5wMemouBQHshxDdgOmby0YG2o7Z9SE3s0GTiw3O/dYZIprRBQ2byCigkstQoLLy1dD
         WKn0fc10ysNsNY+lFGpCeIsIwRTEBdWtxZROt2bxUbqpfo5KRrROsw2feHJHkjShetl3
         mpEMMXibI8UBd1naM4FkZmfzHDTTAz8D1RYuHREFmo+OK9b29WMZ/LHbDMjGqObZr0LH
         LyWg==
X-Gm-Message-State: AFuF++kX+oi+poHKdTdMU/2UTy54Uqnu10Cs/BBfem/zOntEp8dBXnNF
	8xbNHJ3C293ShPLtc9fwl1KdqZOkehsDJTWtdvS6ui3rHsXdsmRle6AtgKFCd2mXbq79y47jBzA
	CcQGOZgD+XdF6FtjBr2c/wU0ublZB7Jz2brzvv8MI9jnN3xKvqErQzG2WtMl9B4ASF/pTWy3eBR
	dLepc=
X-Gm-Gg: AYBFou3b+z0jqVAsaevKm9wkc3QdPvkRuFUbDctvXXV+tZe3DnCbVu3dGzH+5sfZlRf
	jskN8RU8zVexEZdqzlx902CHq2v0peY8ypqyP9OrET3Ix+5IMDlu/d5HmBYKKZBbx776CishlKj
	wqME2PhvaMKZ92Ruqi/oXGOUFTm3W4N9JKni2AQUN6HyoKHi9Q6tL6vY3cuRHQIZwPKFP/aZe6E
	MgQolbFcVz9hRMWljbEDAOniUtSmh51LcXVCkTyBSL9Ieeex0sS4zqUgP4inZP02Jh2pZ/aWk4D
	KvOmIpfrXwmFo5sq55qeh/5/DwPmPvR4+ZUf1mWOwpCFDh+7guzGLfnq6HrsE93j5Ikp2L1lnZU
	DRPNA2Kp+xKcXIb4h8GtK2R9ID5ilyjs1TPHMggJVz6lmlNcRVZIk8lBkT63rBA==
X-Received: by 2002:a05:6102:3e8a:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7ac1dc2d1d1mr322332137.20.1790102526675;
        Tue, 22 Sep 2026 11:42:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8a:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7ac1dc2d1d1mr322296137.20.1790102526208;
        Tue, 22 Sep 2026 11:42:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3559b3sm1587915e9.0.2026.09.22.11.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:42:05 -0700 (PDT)
Message-ID: <3448a4ef-f5a1-47b5-b47f-f208aa02a622@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:42:04 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <20260922183135.18EA61F00893@smtp.kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260922183135.18EA61F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8ldSI3UxQZgl1QG2VwRVKEQ2iOdPAnl-
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2cbff cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=AQOl0tKIyClE0BU_-i8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NCBTYWx0ZWRfX30iXXqJtTsQ7
 GAmyj+t5lC5denDfMgFXvkxC80Af1xUN1SK0mqjqWlDiXpbhiK7c82Pxg/ZRy+FZdU/q8PLRAzz
 sPiODyhDdf1EU1lkqP9Y5/Yx8bAMQXtReSmgPopeCsLqL7LbCCwJE3MBe3a44O3ZZYfsvBJfnPW
 dftfYt/xijsoiT+Wc2cieqvY+7YN+9uJIv/bFX47tZgX88C7lcvlUboZO40UhpCrpOKlXBKxhwU
 tT8D5m0/lAh4rsNnxtQd2eRsBaNGqnvjSnQVdjpLwrlDcoKtsjtnRG/9zdEYhPDuTj0gqJzy9eZ
 Muog8h1zDb/Bk1OZKbr3sInPjCGmAKt7KTvF/ReawNzSELQBw4q5MDE23wXO86CWMZAIE+stEHA
 5c4QFo7GHtNyTZ9iPKFIuOfFAxt4LdpI2rYs/qmIx2U7Pz+24/afYJmp68GtJ/VMV0+bpbZb1B/
 oNC7sxMgUtqHt8kHzGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NCBTYWx0ZWRfX5dUqcC9gqXFB
 HNrIfMgAaeHzK2Kj3yPjDGg4GabvShNzAKEPr0Qp4H9+rgVHDVks63zZ24stRhdNTZvuUB7CgaM
 9Qy8u0cKYEU73FzWmwP2JHeiNwtyb/A=
X-Proofpoint-GUID: 8ldSI3UxQZgl1QG2VwRVKEQ2iOdPAnl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220274

On 9/22/26 20:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: missing #thermal-sensor-cells on pmk8550_vadc breaks thermal zones
> --

False positive probably due a wrong baseline because it is present in 
the QC tree [1]

	Thanks

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/tree/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi?h=for-next#n291
