Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C61355057
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472375; cv=none; b=I+1vCJJT3+fXtp8Nxfoe3CCfmYUSIC484A8GMf33nmY03l8FqCUcgfXVw2qFGCgXBCGwhKBk0H9ccRn6upthaKBVJ2emisnmTDIzCqQPgLnZnjlJrDM3cxo2FTX86cgGRdKC64U8w8GdMxeA4BMl7ckV4wnYdz8mFrR2NEk9uXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472375; c=relaxed/simple;
	bh=fuQbPf096+6djzJq3aMlhIKDtvCLij8MBFXnwoi6iGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPbeiebSyck2i4Gl4YjVixMWMU2C9Gxj8TkIW8GyJbUEadQu3Zlan0jxV9b0QW6zD8Tlw/Y2h8xzpyC1xj8ELsf5s3jMSBy3LV6Ng/nOdciVXz/G+xLTeBNJ3lki5G3xiO2B6bntXLNPpTi6ea/YW2zBSTbycIGDzFI7ZCY9SxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rz8oB+p/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNC25WIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rz8oB+p/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNC25WIZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG8nwT1816074
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=; b=Rz8oB+p/ujoyaLyh
	OU+27j3ddWAeWui3DqjmyaFj/P9xm0aNEM78BwH64msZow4QKlfRB/0YeWvnr19o
	Rm6DISycfCqD6ykArlbZs5awk9Ye6n37PBzE92t3tvpRm4Op1LMEoRzuSYPjU7Eq
	0TJB2zT+mP4zUXj52ECdp5srU2cK4KlGDX2EXY4VSByW9/7gJIQxath2I5cGvM8w
	PJurS60qFkT+GQYbWulp/sIsZ/Ad8ypgBxAqfyKjyL/oje/bXEbo75lNjyH+1Lgz
	kCycBfDxMfKRxQ74EkXP5e9u9puaacLB3JgyTGVQ6W1CreD1aqLBlWNpUYe7VwS8
	jNXddQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm37f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:52:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827adbf00cso3447006a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472371; x=1780077171; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=;
        b=kNC25WIZkBzcAXCriK4NGs7SC3QAu6NIJNmtL4hZpQFjQTpabGh0z16qBpetq/tikL
         nT5wr7wWOwsL7Br2t5mH9qW2+K0kyalcKqTECvEyGxsf290mkqom8azKwSlitTvchVac
         B8w0V5Xe57e1bUchM0cHF/gFXqhtYE3W9L2GnJOytw5ot0Y9JoTf1lOnaS8B3yrdETm9
         /uAc65ryRa7yOPeudbfe4zzA+rcZxB7c5/0svLEmPMlXcbfbOQgQfJPRx5RgCkhrKIZM
         N+O9TEcft/uDzG5e1dcdsnUUWn/GTbeX1CoTKqUGLRTmy4VYJnN0c5kuzBf95w9fy8aa
         AeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472371; x=1780077171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=;
        b=Juh7nLXjnf0Ry3hN9zMGD4eBJ1UsWpbPfzZKKlt8eTYb0upXyqLF3jmgcw4Zk08H/1
         ip4Fka2lesEd5VXtYknhlk5/ggg59heVJ0v1h8cqKr3bxDNXA8/fHGiVUiP/XxtKDPUB
         U01O5Nbfo6TTxaOdhvbwNbVtKAv/sR5ym22MEtDdKA7w+VrqcVXtqhhvQRJ3wlV9FLIO
         fnO5ClBuC9O1KTNkM/HV/msEJ7D5YO0/555G8mGDWkLYg0Ex/l2aLjg9PBxkl05SkmKi
         6ZFphR8Q0ZMo/F6sWj582gae9ti50HYonvBPs5F2HtjGaL2JHVR5w/DeRQxX0Drdo+LE
         UmYw==
X-Gm-Message-State: AOJu0YwyRHVSKCLC8Xm3oTP963/fiE9aZr8J0fYDe2TAISDKkSsrGSdH
	4orHCoHaMepuO1FyfsQPndXMEEzzxlnTf9rzCO7leuoiu2on9kyKtHJLhLI7Wr8GG+b577id64Y
	RXmZ/icHQs9ecct3X4y09qTNepFy0LL9UKQ0ibPv8GyPRekpk1J6m8wwyXODREGqY4d/LsbX0wu
	ZYBKE=
X-Gm-Gg: Acq92OEhfOB5hl6i7h7Mm+RZlgt4H9sJZid03QHm0Vh1F70akqiuj2+7grKRzyl5xCf
	sTFSM68Rq5Qnwc/n5MMzyfSmd/+SPdTwxmZNNt2P3p5DdbGPbbLlMOJ2rA7/vM3mxXzy94w/rCD
	htnpvf9ylFxJz6a47vQErYgh53dxQQaYjt/Bq4vbULOs4qOl/AbPmbb+6OsX9utRtrB8dztvgS2
	prfX9Vwuqdxqy7Ggd0Ib9JXVGvkWx4M1zpK/KGwXT4bENNtVaKk7/609wSHbQlUdLvnqBntaZBA
	wL4KYHSQKAIvN8IQR8/VBxdi6wBuGSPhZBWBls2FFhqrnda+upR32ru4kB1pxT8SmiAdjy84NrQ
	M61pr7+a1Mm/B2BjLp3LlqHVrZ5IG4fcZOhNqj8MriOcr7YeP918=
X-Received: by 2002:a05:6a00:8c04:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8415f3ab22emr5037835b3a.4.1779472371515;
        Fri, 22 May 2026 10:52:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8415f3ab22emr5037770b3a.4.1779472370572;
        Fri, 22 May 2026 10:52:50 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm3022799b3a.61.2026.05.22.10.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 10:52:50 -0700 (PDT)
Message-ID: <4787d5f9-601a-4d27-91d3-33216ee6f64d@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:22:45 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add Shikra EVK boards
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
        conor+dt@kernel.org, olteanv@gmail.com
References: <20260519-shikra-dt-v2-5-c01b90fb4395@oss.qualcomm.com>
 <20260519123738.BD9C3C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519123738.BD9C3C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Zsc_w2TaCfRnY1WF98trv4wJi4GjEu0V
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a1097f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=enBp33lU/LGHKDsbTNpoHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vBFCELq6SH9PKkL908QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3OCBTYWx0ZWRfXy9iqtbZTv2C+
 VxhaZNUmwLy6nUSCtDmV8qseMxeqCwVD818wHFdtikrLH36Of11mveF3niFjVhfqggbyPz4+rdf
 Sc3u6Fi2T/vKOTILonQUfXr90NsGpxMQ11ZgsAb8mdQq/Wh6vbetaiW8RuYHmzBu3p0pzz5ysUm
 xUgpgIYqjUMvEgEwKuRCXUjTz74BAbiJcu+rKD8/Yjf7FOj+/DVl0gPI3CC6FQu0zn9zbXG4eDI
 UbbbQwoaBf4od8w3YlWPEZzOg+zHYnXNJIb6+JvQ911Bs+0PPbE6adGfPl8EWTIhQpYMyoafX7z
 cHvXL3yfO0f7GCeEljW2IqHustchDC+JKcm20KLpqQwNUCtfiZ8NUqyHKZyfOCneb62FVEIq03j
 5aZ3nDmHn78DgrMSfLGM5xdqgdXDw52M/pCcr/w5s+7k5mtA1RkHPX5ZJEv+r123cPGlC9xt6ov
 pfBPbKPbGJ9+7Qu8EOQ==
X-Proofpoint-GUID: Zsc_w2TaCfRnY1WF98trv4wJi4GjEu0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220178

On 5/19/2026 6:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] shikra-cqs-evk.dts incorrectly includes the modem-enabled SoM dtsi file (shikra-cqm-som.dtsi) instead of its corresponding CQS dtsi file.
> --
>
> commit f25002d6be7ef75f4f5e2dd5f32e45a22f06fc01
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Add Shikra EVK boards
>
> This commit adds device trees for the Shikra EVK platform, combining different
> Shikra SoM variants with a common carrier board. It introduces three specific
> EVK board configurations: CQM (with modem), CQS (no modem), and IQS (no
> modem), along with a shared common include file.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> new file mode 100644
>> index 0000000000000..ee460d8c6a877
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "shikra-cqm-som.dtsi"
> The commit message states that shikra-cqs-evk.dts pairs with the CQ2390S SoM
> which has no modem support. Does this incorrectly include the modem-enabled
> SoM file instead of its corresponding CQS dtsi file?
>
> Inheriting the hardware description of the CQM board might lead to incorrect
> behavior, such as wasted reserved-memory allocations, or potential probe
> failures when the kernel attempts to initialize the non-existent modem.

  #include "shikra-cqm-som.dtsi" is intentional and correct. CQ2390S SoM 
shares the same PMIC configuration and the same reserved-memory layout 
as the CQM variant because the modem processor would still brought up on 
the CQS to run auxiliary services, it just lacks the RF/modem-peripheral 
hardware.

Thanks
Komal

>
>> +#include "shikra-evk.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
>> +	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
> [ ... ]
>

