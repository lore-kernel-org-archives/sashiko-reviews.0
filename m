Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356264DB562
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618725; cv=none; b=i2jA2Ma6NPtQcXwgMRHoRyq2sMN8511aoqGAhCPFRArrIbBj/2jlhDb1C/i8YParimPoqHE9ScVB9PZy3oDJFOtzadKOKGY5eNpYJQzvj/4Qkzm2/0hiqev3hq9kR0VKPkcp7j1c3urUSc1VHyygLZ+kNpdpTPHn3ztN6GKQxwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618725; c=relaxed/simple;
	bh=4UXEbyORcAwHgjjDR4JOOURNBg21vbzMhO1OXYbnUSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFQSy7t4knaVL//dXrtvUmhiDqvzDkqzf9lxe/UkztkIXyapim/y2yqBXM5uAoVwaACTxDawrt+/LdFjxDxYl60K2y9jSxQa9jD+Axck90NZ8xeb6LnVeL8JWb8xskyTu1sums+/L9jPgOgS4QncseR4Iza217wlRnaoKNTgww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaikMcD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEO3yMKN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaikMcD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEO3yMKN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXLi42518956
	for <sashiko-reviews@lists.linux.dev>; Thu, 9 Jul 2026 17:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=; b=MaikMcD5LMptoWoK
	o9ZlWXVxRCpuuHmpFHHIDu0BPePzq/N890bhlofI6JD4ZWQmepq7CJLKuU7jKJ8E
	iSosRe8EnP4ugIY5dXs8sPvt8w8Wq4+6y7dHCviw3GdUR+DxDjVd64+fhtqf9NUx
	ACNUqfeVLWUH6pcGYZ1K/SqDRALHw7QrQQT2ZgIiRQxIZfo8Qo2C+JhIM0R9WKqV
	gZ+ssw0jDSRuqibMD3v3C/GkDUm7XbkvLZwpjHok0PfUsjbuHwec5bud5/iDkO2r
	dNus4WSUGWCJFcmcN5MzPHOaWNCJNsAkuq5uLyVpuyFCcNJFVEbC/SOgGmYT3czV
	1gNy1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn8mnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:38:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0f45415cfso1722736d6.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618722; x=1784223522; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=;
        b=FEO3yMKNHnNv7Fym+oQxJHEYgMHdMZhQ3KHNGbWv6EdplNwwBI0q+as63xzLXA+u1F
         S8Q871TX8fhOFceEL8BBM6v2qCc5m875SaE3k+n3IYns82xghUNZ0zdoJBLEoadD9tH9
         1refQJC2l6qKgYUQEwthtJxBsBTKcbXm/e+yrkyXLPQbezPhQUz1PvKEM3xaWncPWz5g
         vJRmYOAfCu6GysLYAMlyBgqwQLbdTtic107PDOujD6OVNBSxPeGGlvyjwVV00y1I+F/H
         dCfSmW/08+PHkNNu8+39Ua+gsVMJdvdjmlbAW63TfFQirirIL7gCkURzHnd0+6V/jpOM
         bqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618722; x=1784223522;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK6187T3L9xvdfST0RXOQYMxi/4Wqewcyoc6MgC7GX4=;
        b=UA6yVnhqlbL1rHKj+qjJBHlnthLLcdgZ4yZP7ZwFayuoHd0GP8TfUvIa7YDsnn4Xtg
         JtZS9K0OFC5jpFWXWa9+imXgdRD2R7hFJ1ahdKI/Z01f07EwRWMTI7EjndrsdmlvM006
         WWu6LSYIHGsD7v+EVNuqRA31rRAPY9pIVlmWU2n3q0e45ZzbgfoxhPSP2F4/9Q1oYiG9
         xZHNVwxPHdwF1tCb4l4W+wJfien2HL+bagbScdzXJtguP6wdu95GTawAVdlOsow2cz4x
         mFtWZ07da4PEkjhXhxuQO/F5jWtgiPdluLj4dXBHULH1j1zSaWSS+jz6+iOCk84FoftJ
         ZW2g==
X-Gm-Message-State: AOJu0YzU+hUT5o5munNZASatJ3pkpBiUixu/B7fhU6fj3wQLwFGSSoyM
	nId00XwcIzuT8o1EOUeB1i/GlWt3sAc+7b625BjODDd2LL//63ZmNSXircTHaFgBaVLGSsFjl4Y
	fkb2CaGQPh7KBDHKf3tcCSQmvLFlCy1Q2NcQxI4JTJAKS5iVLAVBiJKsxchPxITyMYAxN8s9b/d
	33ecs=
X-Gm-Gg: AfdE7clTfItKxs2hisMqEbYQvrEJOQy9BGTtls3xmq0UKfpUCKgc3YUiFVRz6ml2FU3
	KrtEq4AsXf4L4f28nwmtRy1RRxbVXCn/2cUkB/RJ7Q6RFAgDqvz70UjPJvsZldT+e73joxCi+xZ
	SoIgyVi3FjqFOH0+VqyfJoxvbGUc7qhfK/AL8lBlExNTd0Tucb+6cb8qXLa1faK1ylCaFNJpQ+U
	uH5UAUNw6KZ1RHR9xTKHy3CASih+hGVzzn2B6OaNjZlE+EpZMNXwnrAQQiwiEiH3DSwSlOfLiXV
	VNuNE5TtpZeSVwVnIOBOW7JcK1rM9ANCR9Wvx9/sz1/LHH4eO3+9QnEMZF1dwEWK89DN6dC7IBO
	6ZyKb7y12VZQv2WdwCGH3Q/cVwhItJkiNjbgb8z0=
X-Received: by 2002:ac8:610e:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-51c8b2bb8afmr95940961cf.15.1783618722536;
        Thu, 09 Jul 2026 10:38:42 -0700 (PDT)
X-Received: by 2002:ac8:610e:0:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-51c8b2bb8afmr95940041cf.15.1783618720815;
        Thu, 09 Jul 2026 10:38:40 -0700 (PDT)
Received: from [10.204.141.154] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm53200522f8f.5.2026.07.09.10.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 10:38:39 -0700 (PDT)
Message-ID: <f94dee2d-1f2e-41c0-9335-daa6bbaa1042@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:24:08 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-2-c175e6401150@oss.qualcomm.com>
 <20260708145005.5B69A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260708145005.5B69A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX7Q4bPxTzcFyB
 CCNT121LqNaxApyWoFCqMkColuyJGiJ8FJpYNQBO7Mmpi0dWOSEGfNJD9LvAneOEV7LZl/Hao8N
 WvTi7pzr7nybp5cB0rHFw1nUpVX3QOQ=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4fdca3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: y7AtoyU2AxVatDZm1q_stV05whLZgNLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX2uvNNviiU4Ev
 Nz7QLX/VmwxFDx5xZygeuQPmHoUY+LNDvDYsVA2ArpiQEpqeT32/HQG6x5pFMyN1CuL3My1D2Ss
 negopWqklOtml0xvfeDbrSfMH/sp1c7ABFLvenyzbSAu1DGx5byEd9nY9TgnjWG/nAo3b2XtCm0
 /C4mcegzg+M8OFYKNHEreVPX06ZIZ7dgnBJ6wb7ymqP7eOiXVfn3MyMvcPEn6xnk1lc85gKurzo
 YiCxRbe501rBwc91j5lOdapVm+/mbGqS734szEFMQSYj0DWIDel1uy2bhkgNy0G/2HGkEhLXWkb
 6rnL8aKW4N6XToz3E8J/QKCKfzM8Dd99YRtfXkPGkyq0F7LB2VfQF+sbXZN7KJVpB0If5ecH/3O
 /FTcJj+JgUalhzr5xLktg13uHl6iUMAsnJ8UbVlGrPOedwWTfMrm1wnrUJEUh55Vw2nTFBwipLl
 XV4yHg5sralC3UOjzaA==
X-Proofpoint-ORIG-GUID: y7AtoyU2AxVatDZm1q_stV05whLZgNLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

On 08/07/2026 16:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `check_mixed_indent_chars` rule silently bypasses property continuation lines, rendering its newly added space-limit validation ineffective for list properties and undermining the patch's stated goal.
> --
> 

Ack.

Best regards,
Krzysztof
