Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3239989B
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725041; cv=none; b=ukcMY3vQeFfMpLdEsgH9g2M/nmLcpNM5TeAegkp+xOW+8oHXqJ053xP3iOCg+0BH5vK63ZIRYPL7jw7hg79j8m41KKo1Y4GBPwhbhZraJkRtUM4kBw5c+sgF83Gk7f1zRxFLUuv+dOZuP/LjNasnavjVY3F7YbdaI740gRulDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725041; c=relaxed/simple;
	bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CohtGhb6TKC2bKWn6wVSl7h3SrYhg8fUFfaqGB0WlczhlIKOcazZ7hIyaD69ABte6gli0G3PVoNqo+SRuHAhqDfXrnM58jHOA16JDgwi+i9w0jK15jYHlWSKlDjBfVzgziLIWqzBNPrFBYOkro3+Rit2+r5nGFCF34SwXmx0NJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUAMBa7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGxPubX8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUAMBa7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGxPubX8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HEP5713653
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=; b=dUAMBa7Eplid8Yhr
	yP2ByFV1eRhrp5NOEm3x7MZdLUiguOs6mSTmBttmORTdFieRjpjSiYGOKSXetCGQ
	1BpzMDzHb323Z0oIJmKfIqasVWFSUokkgTa9kcbL1cm+fbrqGW5TpbGErT2I8Rr3
	u6F58coNeqy4JK44f9fvK5VTQggIrCWjKrOql55y0LtKnl8ytGGPDFVKpg0mr2aR
	DAan5L9CZ2b/3sVsCcxWg/kX6ZZAj42IfrEKYuzl4rpTlnSNZRK72hlQcRsOEgUc
	mUHx23ftd1OFH09t2MA05Gd42tfvyB2/wSd6KVjMzQJpHbbLDjjJwflYDfBpc6IF
	Zi2Lfw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bnjbjna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:17:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso5838501cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 23:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787725038; x=1788329838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
        b=iGxPubX8Zbb66TV84od8K70EbqZ3wT2kA0Iy4Qv4MdT27Q//PjNTYbMwQRt1cpKhmD
         AnDe4AF+NE12w+32EOPm+rip/ovR46zCQmA7hl7usbz6TB5SZyLgpPxAfHTV6b2okZ6H
         6TLxgl5g3DCE5lr0prS4hNTntwZgOOzLZmgGg04ZShpWGsed1NKG/IeAgpeD/4+5zPQl
         5eTo4dM5jDGurhsO4raktLWkdLttdHnVCfPdVRFWxo/zBe0nRZga9J1MHOn/AA1RUsIU
         cvZgi2sPn4/+2MSoX9KS227kVzdGtW8r/u3jw4uCBaxDAF80ELDwlv1lhz8ylKsv00im
         JozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725038; x=1788329838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3axoxqLqryGdc6C9hzOQnqSDnmHdYVRDkbJBe5fQSY=;
        b=PqC4mLt55AWfuYwuMBm8Ht6xaFvAdX6Z0VXzHKpX1TQrNyWWrEWvexWuD37w1OydVI
         OL7WNE5QCSUmuilWP0GGzSioAjVV11JMtcGJHjGSl9fPkvkGObvVv59H6WBSL/rbkMNX
         uTrwiMgiHSuvxf0SyxdjszRx1zdjElgtqOdgjzDEuZg9BzqDteUJJVhR7Y8z3vg3t9Gg
         MP0ihhz3Itza0kqsHgEfKc4pC1Sg1SMiNhjuuuyBD5rG4i+C9/5DyjFaiY9yUdvy5Rl7
         BNA/GDXsFZlUyKihlVp7/RO+YlrLbcZ8Lhm9qu+c2yU4iawELQwhKIcoTwT3eN4x51Ov
         IlsA==
X-Gm-Message-State: AFuF++lwfWZBSpWTifavDF4PlKpEd8TrLEHucRlnlVDMsUpqGy8fzOUh
	FkLquorfG085IZHyIoYV2k8Xk4sMWjwGADNw45uS0dT1gSmrk6YGpAtmQi1Up8xzyleB/dYIzrp
	wVCxcu1R8LXhnNiS/Cik7GkMMdThRiCHAnUPXzJJeYpup9oVky6s+m7iPJ1qjr0D2vAEWhno0Oo
	kxh7M=
X-Gm-Gg: AR+sD11M58wv1PuDsty0KpfoqBwYIIOX0mpZ54sQxPIgF2a4nryNc+LcKV9mCl1LIhf
	E3y+ke2400ISqb2KDgVKigzshyM72O7sV0uwdP+YhzKRJxFAi9QnwRqdb5n959IaO57xlafD7XF
	3s6OQ4WLinLC/hHZhFBPSeRZGaSaQyDQHJRvK+2Ca7QzCzfXcY8n5aE3ykbjThy4UaOEgGdlXDT
	25CF9Jepf4SUO3eCh46eI+fpUWADeJHVcQF2gKeB+ersG1lOmwCeUhs1+6ixOnKix0khx2NWMkt
	CctKnW0LQOPfrc8rk9gqllLIE9vyx5+R7dtdKNveIs5FAQ6Mq3B1KXAAChcV0ZN61aQrHmf3BJK
	E5iUp4lFVn3CT89NHfggtqT+F2VgN
X-Received: by 2002:ac8:6906:0:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e423a7f3amr45500831cf.33.1787725033067;
        Tue, 25 Aug 2026 23:17:13 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e423a7f3amr45500561cf.33.1787725032612;
        Tue, 25 Aug 2026 23:17:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88aa0asm365083866b.35.2026.08.25.23.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 23:17:11 -0700 (PDT)
Message-ID: <504a072a-b856-4145-b6fb-54d43cb99fa0@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 08:17:10 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
 <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
 <20260803091619.827961F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803091619.827961F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wU9RYyh8B2cMhlXqkiKrjw7U-CGLBQfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1MCBTYWx0ZWRfXzZcph/omRXCs
 TeOcqOHXUjXycvMFlxy+f0MhsrjaC0LP0+TpJZHvIweZ37JRYzuKqL5I/vU9fGWyPtQg2exIdWp
 kjlndTln6X+YdSlS/XmnhkjliekcpG57v0EZALuiBdrPi/409y7Yx0vQHXrdZ1gOhF8EaiviC/b
 c+otu74z75MZ02WSbJ/tw0wT7zG3pNMB0il7edVFuWwFmdcMnNL2VqklGsBodk7WloCUhTqMhKv
 EX+qVz+GdY2Jh+r+jofrGTU9UmBzAY7QQJO0lyua/RAhIlNznMmuvKnXm5CuVjMaWkx5TjfcRxy
 KY+aVtk7BOvaTcOmhXTz1kp30Bi6Z76YoXnKvtc2bGM14cY2wSY7bcs36DMCI2gjWQf6qh8dJ6D
 11SR6T+XzV/O2eNqKKfp+wv9hfef5YjX3+vMvzowkThTqwkpQzyyYLdn7ud2OsEYVklolA/8Res
 ffm44n5MkzTEh7Rgomw==
X-Authority-Analysis: v=2.4 cv=ZuHd7d7G c=1 sm=1 tr=0 ts=6a8e84ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6wWpjI-6l4EqYhd0jiQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1MCBTYWx0ZWRfX7zM/w1VrxW6Q
 HGOzKRYq7jK7GyW3d2GMZEm6zIFea/o8eotCB3ZOXYDRYNifKu8K6U2pgt8qn1KKI280RHPfmmZ
 M1vY4ptUdYXFELDjdku+QtxjkV+IkL8=
X-Proofpoint-ORIG-GUID: wU9RYyh8B2cMhlXqkiKrjw7U-CGLBQfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260050

On 03/08/2026 11:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Top-level nodes with the same name but different unit addresses are no longer validated for correct ordering.

"No longer" is incorrect. Top-level nodes were never correctly sorted,
so commit does not make it worse.

Best regards,
Krzysztof
