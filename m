Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D24CB8B8
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786241; cv=none; b=G/ollaa61T4Hs4+xoWgWLHS6/D8/N9vsdNfqFt+49jQDezVQoErwukha5wsA++vYrhqW2DaBv9M/1tgTMttzgaSeY6MYs2hztOYi6b5Shvg8rjMkDHDxgGlFcqG1x5ycuxetphMeAdpgjSoai0dAR/Ow9YLl/71hmQ5X2PErbS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786241; c=relaxed/simple;
	bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo6h7MwwkufvGkn082lAriuYZK+Bz991N3CwBZlE3Qxt6qhGB4FzZ+0hDrtgByrgD7IO/u/JXRzJ9MHAOL5Z2rxQZEORoO5Tm+0T3f1PcUW/pVblM7+6ILDn26AKJSVeElePMtZRR+XkOhKT+06q1+wHc6Zi8ISipjHpkyzpKDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZhfuJtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWa4azt6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZhfuJtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWa4azt6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnYSV004480
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 13:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=; b=iZhfuJtghjqe30Sf
	NkPTAUBQ1azhCIPyIU5kPudBwzazGbAncmU4S4LrH8geBYwE0YhRSXAjC0tMKESg
	zLf7MAxp19AskYp8Fk1L5z8XqmOA7DWwLk4AdQgMEwGgyA84/+ql3++AdFRVFtbw
	pz+p6pmLxUohExO7iuhq2PK/YQuV9D9WZV9YloS+NR1jTpCCl3nOIL6m/mr9PzM0
	eYDQrgca0H7vjbE6va5X/ktVR2tsNH0WEC1Z6lZ7R3/E6qp0TN7+5s9UBtNbtZhr
	oFG2UFsb4VON8aT24ugpNkcToXQM3bqO964+SREpDSqBrZI6+zsJKBaURmO+7GhB
	3+6OmQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg13w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 13:03:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c5db8b6d03so1212059e0c.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786229; x=1789391029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
        b=FWa4azt6g+DCbtnYEoVcmiL1GKrvjyPubZDjVGnUHzzlbhbcVbEdPdiLN83qUA6VE0
         RUpConbOrS3xCLnQi9DZsZN8ZignAHFKsaunSBxbPyatCZDPxeq4NnNaweqoAQDyuNld
         jGxVnn2rHAyk+fcQ8v+d8oWdvBdHDYou5BdWap7KMUKtNdY4hQW0Bx3ZkfJxrSj0A8cX
         Ilk6l2xErAx/t7wSbkPKl9PvpHy0ZPuHr0/GCF8uOlqACR5zFogxJVfA1GoNIJv/AwxL
         o7xD7j7jEYePCC+y6j2+neIGQgY0H7MO+rhaX4EYSddYy2LiDi7LY3BDKlqSDhM3e1+Y
         WV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786229; x=1789391029;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49eWOMRTz8b/nRYqL1sZZ5PDoGraU/KbXkHhAHawsZg=;
        b=hlIqRiZ4vYvpTlhs+MDW2BUhQMl8oU7JWLI4njSxd2XBxmUJyXtIYYV1fdWQEPnvsI
         98UWux4fRIwgPgIlq9GvczVlEEfsrjIadcYdWh7SQ1ra3Wv6ujE59cbuu/3NUkFkvQ3m
         AS/+LQ1fqHoGPFTd5c3Hlx5sdWipjlnvicGYLY5d2w3m/MqBteqdyxw50EtllWvN1zk6
         QL8nVYItHzR/UpV3D7++2FisNcM8fMCzWmlV8erOBhI5t/5sjGhgTsJIgC+zSoNt29qL
         /+odOLYKDxsmRv3GIdyTaOkyv2ICg6KXZZf04DxZWizC8WIYleUKFR/DD53BmHujdc45
         aREw==
X-Gm-Message-State: AFuF++mhP6XJzg695qqzqaBPVDwBFQVcsCTqOIZgRkweFVSZLFbnEjgy
	pfI8wK2gL34zDGRg+CU84HUHtX7Rqt1duGHenz2oaNuxWIhRiMLrV5s3mF3VOwMrYip6uT0+OQ4
	isrwgSK+/pisuRXXgUdbiSOglFnWYZuUAbaRLuGHrtjvH3WLTBhvb7ZLrwFPXlqz1oTGulVTNYQ
	XbSeA=
X-Gm-Gg: AYBFou0kQGZ+a22/wfiTFZlC8Tr1RhgmPUnIMPaJOWzzIfArOHKFk5n0VRIGF3h3hei
	LAS6HtS9PdZhsJgjz24m9hgJ4bn+1QIjS1jY/cL0npJ4F2S4U9xENGM8+Lx0GzDHe5E1fGlk3Rn
	rUXnCnwkZ0tzIwLJ0uUBO3WS2zV4G8MPSbd5Zwpy6GU5xIzqFLNszG6AkXg4N8xUsPneMKoj4Lo
	q7eGD5svoVBq/lzFFNfqzqN91pWc5UkK0fk8NdniCIMJX93c7Tx6q28NoC7q5ZX5jPeCvj5J6CQ
	Oo3I1SX1oHQtPq8ZgYJrwInRY2m3XPj1SBR7QYkRO5yntoC5OXnpOOVfAHMTYkLrcedgEGkNh9W
	6MwsRC7I4VdDPwXP9qf4tFU3Q6c7f
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr9264669e0c.5.1788786229405;
        Mon, 07 Sep 2026 06:03:49 -0700 (PDT)
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr9264575e0c.5.1788786228908;
        Mon, 07 Sep 2026 06:03:48 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm388303115e9.15.2026.09.07.06.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:03:48 -0700 (PDT)
Message-ID: <6a485a80-cf23-40ba-b385-fd35cf0e9888@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:03:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 08/12] drm/msm/hdmi: Add support for PM
 OPP table
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, vkoul@kernel.org,
        robh@kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        olteanv@gmail.com
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
 <20260828141602.211751F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141602.211751F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfXwikE4Si3l3Bt
 D97LKDgNK9ZPDK0X3DjTJ7kEEciPyVMqWUu2UhgDiyu/RLtGUrlOE0+BHnXkkI3JzDbV4qVO1w+
 GDrtK6c74wqi4L9NYBwoLwKehPpaLFlwW/p5jlCEu0/fbSqPvCSUgTFCqn2xpjSA7WTnUO+762w
 EMCH+dX/AykDEIAhFSY4JUylPgKNIYu3YO8Yb+He4vf1cpvssXGSWFRQ/qw/kWEyaAAxP8V/S0C
 cWrH1sZVc+cI2oV+Yem1Bb++Yk7ElWqSJvfiylxdoHH89FlGeA/GhwdbdTjGzWmT8fB+pPIb+7x
 YUhEsfrL/F44m2HJamg9IN6eWoWs48ygCXJY8ohYKpuFbyp/Lw5rKZXpoMVfTUlDIAW4FwIdojK
 y5o3uEla0J6SwL+GVfrHA0KVONYeDojwHXEYEF9SXpEJ94bbtp72jV4JF4E9GrFwaFRZQTawNCF
 45+/Fe9R0pk8lok28dg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb636 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: pCnjDwML0Hyj1vpurMtPl2a0nffo_EPM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX1afJ+P5b2M4k
 OBvrjEx6CULagZ2/ua+kfXu5oZh52FK892D1g5749nwlt7qfgt+hOBqpubLWJW67pUFgtb5c24K
 prdbfKDChEt/Kho9LwsIR1g5SRLCJAo=
X-Proofpoint-GUID: pCnjDwML0Hyj1vpurMtPl2a0nffo_EPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070144

On 28/08/2026 16:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional call to `devm_pm_opp_set_clkname()` causes probe failure on platforms without the optional "extp" clock.

Ack

> - [Medium] Memory and reference leak of `hdmi->next_bridge` on error paths in probe due to bypassed cleanup.
> --

Ack


Best regards,
Krzysztof
