Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53107498925
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947830; cv=none; b=EJOfvLNcpSuzB+jUhjHclzYNtQW0cpbFsjfRptq26BgaXu/akdGJT/BoN3Qkmco+vr4Exi5mT3HCn+t7XK1wsr/KNf8UglLG6d/ypVJfyOtGQfLro6SansHPkYBYs+Hx8Lau/EmZ/w8YvTLDVZ1LlhftY57BZTCkViBHRdIotNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947830; c=relaxed/simple;
	bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVULuA8IYigGV5oSZJSEMyGbeoAPCfM3SCdo5KB0mShdMWkrHPdG5UBpL+b1c3+e5OV0WYFiQ4wSOB/4KI9nNs5NeNv5lfKSkwTpJOpSjBVdbt8OF4Bx38tHui3i6lwlov78BDeEDuQHRs/IIYsXXZQ+SJDG2Ed/lRdQiMgkFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNnOUtFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXHBoV+o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNnOUtFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXHBoV+o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Y9u1045456
	for <sashiko-reviews@lists.linux.dev>; Wed, 9 Sep 2026 09:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=; b=nNnOUtFHsQiEhRzg
	HNmno50vtje/cdLK19xO/5ypU6XWEyFrvnDVrgL59km+2dKlWnGpa8BRoW0PoyVq
	FuBRN2RwBzxEud8OL4KszNO2wBbp3H/lXL5n8fO56CGY19/j1w78bBVOha2Tt1J/
	bw5AsVywQDlNGaCSvVRF4JslUL6zeOHeJlJL1FKaYuBf2efWuLdvfkyPAhDZ6MbH
	AMd7ip7/OBzPZhFsiQNT8MxWisg06UCRgfpDelQfSGQkKWI9LSJ4GcbjbnL9pvrm
	wh6WFwaRh4/HGdxivH/xOVK8iAhuMcZq+lB7B/Yh9VNjOLvKLn+/hfakb9PGSPRi
	KOfjVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewkbtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 09:57:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cc934fe9eso96115326d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788947827; x=1789552627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
        b=EXHBoV+o2ghBPReiy++iL3a1rVV/Bhm2G7+KmyFlZSbCl4BrEC9CQOQ5d6tMBmpg6C
         HE9PdSHeR+8qQI6wvokfRpAn8fZOuiFmwm9inkLsr2UG+BA56Z+VlxVReeXjVaYPQUwF
         X7CAFgWYKa5D3a9F1EE82L8Y0s6Tz6EIeZNc3JZSvysv7Ro9x2/QSAmUrC1nr9KgkEzs
         O51X/e6pJGSTCciFlftfP8m0kgu5nJZ9wTHNipNlCGgwVoY1ZApGdb3kbKTAGdkNw0+C
         4FCamol2ci3vqO42eXaTy3ShroiK0eoTZDhRQQtiibzCyDx/qw+D3nxgP4nuTvLiSZg1
         yCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947827; x=1789552627;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCRdocgWpRy1emNSVrGITTD8CnI0KMsb/yc1qbFz+nc=;
        b=jAjEFIRFrlWSph7aejEOr9xvlb/BWtPoirno4PYg3iyM3fa5GAujOvuC75tQQG52XJ
         wMpM4SJ/Zp2Rcfbxs4fx9cTv1MXT8Q8u6s5p8tCue3+VYVSyCFqkqeKvXiOHQGBzIMW9
         ZgZOqfFpqU/J1KKiQZzqFw0CinyXvEh5Lt7s303R1jT8dpjQw+6TKKHn1lPuYdVBLtyX
         /ZLjNeTdDctHKLuKh4CQci1egrRe8r6oLXskdBw9Y/MEIX2rzInip2WAAgHYuWGAvamh
         YfMcdHfjlBvE+aWinXeT8Nx+oWceeH4u2QUTUDyVXMeluU3viTq/wOaWPnnWFy80G5Nb
         SrUw==
X-Gm-Message-State: AFuF++lywFsDnkWh7S4cKaNf7ow/YsrcutWWdCDnzYvMnqengJuleVMh
	rF+qclXqHmsagAwrnewX5ezxlamwUkGCwRdgjdu7jVO0CSl3LdW41xOt7dVRCHmf+MBIwzSd3MD
	O1qszS9Nn1Ir41pE/LvvPy+MX9rw2mfaLJBY8p19Lu5VU5W1MIHeg6unuPKYx4KC+RLgNRwg8O+
	N4iMs=
X-Gm-Gg: AYBFou090Fm0OBOA731nbcUkZfuxRkOowoLcay/qMYvTwe5c+VKrDmtj4bE7pTF8x+A
	Qf4pXQvN/9rmjbkZc/gFiMZZEMi0qSZMP97Wpa6sPcT3Irb0h8lOAFHIaLu0go5LY70mw8xzvni
	Ce+Xyx+jvkB9EaS1v1kHWclZBxldWwt+IWOYv17uK2y+ZJhqXa7lM+Y0mhaLvFZchuYN7e7bClR
	oWbP4Hcu7+pCOxlO7QwEUohI8mleJYA0y4G8y32bVqbN8Gcrsaseywl91ftcGYLVqJoQ+bPq2+q
	rpH9NW2iotPu1lqGmgSSkqhKA0GcwTXPTnHRaqlMUMmGOyGqQrU44PjT8M0xfgBJxQJKhNmynND
	o4u/ydHd+SMuaLI24/R5KM08b78Pd
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id af79cd13be357-9398042d815mr3819780585a.28.1788947827500;
        Wed, 09 Sep 2026 02:57:07 -0700 (PDT)
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id af79cd13be357-9398042d815mr3819778385a.28.1788947827089;
        Wed, 09 Sep 2026 02:57:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm1004938725e9.15.2026.09.09.02.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:57:06 -0700 (PDT)
Message-ID: <1e486a39-1327-4199-b493-25f73740dbdb@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:57:05 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] dtc: dt-check-style: Unduplicate checks in
 check_mixed_indent_chars()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
 <20260909-b4-dts-style-checker-continued-lines-v2-4-c5cb4c9d9b66@oss.qualcomm.com>
 <20260909084654.B69C81F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260909084654.B69C81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa12d74 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DM0MWMn_kPhXdnrzG3ECtTAjKDs5yTNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDExMCBTYWx0ZWRfX6DSGwI97/tp8
 +vh3Q202PJSOcl1nyHAw4XKwicGC2m7TAXH4tBrzn3CgJldcqj0lt5EipXdNA5aASoHX+4HcBmF
 p/z64eG1Ba3kyclE8JpnQFopu8HAcFlkNUTldVoI9lCrHx5MIo4VL+DqiQVOlPxayu5+vTYQ9O7
 rBBAlzc1UjiGPPov+4tYfX4RTt2bWcUZvCsxJAnwMV6TcYKaml7+xC/eIh35uGa9BkQhJy1dlwD
 J//r6ziKCJGCY+e570dc+TrTAOWgD0w7Iep2BlkTmWQLXPogq4dTDhqwD52hEg8Jjg4R1gMBUB4
 zF6G6gDs4cwH7Oukc1acN2L90NO6ZePIdMI6NgBGOmrLIMGZsoPGDswslDTyB8f1cFyGWGyHeI8
 nBudysG1lRqVhm/8JkbQT4v44R94Weh7NY3iJGjx7erA88cNRtvc3Ohrb8raYapf/Ef3JcmTrIt
 SU0CR7ITHblpoA7IK0Q==
X-Proofpoint-ORIG-GUID: DM0MWMn_kPhXdnrzG3ECtTAjKDs5yTNi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDExMCBTYWx0ZWRfX+sMTC2ufTAY9
 GObc5RfrB7LCz2OOgm0yHw6JjwBFfUXHUu/r5YZxd3Kuln9l2ZV8kPb+qPmy4g+0aexbVjFdLi8
 ndba2uAyMI9g1R0ZTeI6odWNe0BbyW8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090110

On 09/09/2026 10:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Undocumented behavioral change in loop refactoring expands indentation checks to continuation lines of unindented properties.

Ack, that's desired, but commit msg should be explicit about this.



Best regards,
Krzysztof
