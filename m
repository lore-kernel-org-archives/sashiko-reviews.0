Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9ED409E12
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097737; cv=none; b=IAuWH23K0MvkDSUnhhYH+TTiwo5bDXravuOW27KwIrUaR7x7DNqMDEwDcV44YiwMaYB02nZHEzRMtz2zRw1zFld/Q6pUMH4mtnt9WKHp0FheKK7M2HsiI/kptbzvFd38sNCEZygNN3dKs5XxBgDb82gDHm3nSGYB2k3njOeAEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097737; c=relaxed/simple;
	bh=DxcFDEDab7M6jTdXLSVgfP8bv6eIibiRgkV5gK/3UKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0/CXpT6RljrECXvSerRQPWFLJ7yRQ1V6XiR5sfdBA5d6Qxb0Cz38fV8A7FhbVtO+0ZHYYvbRU+4JuTbZg2qjo42H6TY2D1d7DOTWQ2IXNteMdu/6FwxUefuB3LwIzcz8LGNml+ZhkazUkPq4Ozjz/J8W8uKtzBFEPK9/FF0blQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFGe3Wbs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2rLHH2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFGe3Wbs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2rLHH2g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBjJM1134965
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7xGelfqpYfB35fDLv15ULStO
	ev6jl3t5C08PX3tm+2Y=; b=JFGe3WbsfpL57t0BSkZsngpT5kgI6RRH05Std07A
	4FImlq9LMUdl0kNK+QacVMhN5RrAtUobwaVFzCR5Sp4uNY3gZNIxflAm6a3wh+Kg
	+y7cu/i539BMOIG4gplV6n2/3c5+gAL6D+WRJfmDDo9i9z8Pbu5is5TvXLOaq9Di
	fBfXkkWWeaL2ORdLr+DSwzGB0wFdBK2MDXXg8ikJYl5Me5mB1xZtjsTbL7qmQNZk
	F5iI0SiusAnTs18oGWK5N6fh6wO+kzvaZPT+2W7MTUSUE3RrExmHzpe6X9QdiOiv
	Qf35TbiWR9uIi+En7ffU6RqgITn39AXi6AoKkEsr+hNO5Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1syg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:22:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963da2c73fdso1998438241.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097735; x=1781702535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xGelfqpYfB35fDLv15ULStOev6jl3t5C08PX3tm+2Y=;
        b=W2rLHH2g2ZBMwhEUA4Ezjr+iOvWoahNZ9/yiQMlhoy+VzevTvIDXyLoqEz72Ul8F7w
         +JKTdBUy+b4Lg2W9YLMbhg8JwaukJDuUUm6xCNmUIhsqKANQSUAB/MPCYNUVpSA7sKDa
         n+s2P1g+FgfwG/pe5Ln9f7f09j27z1CzM5c8hXH/0by6WOT/CU3x1fqhg3C47VZZB6ek
         MXkIFLfc10bpWrIFv+NBy0yZlBhhqyUVEMy5NbsPACEORZlEkFxf+juru/p5gp68wmLF
         Ivlgpo9HQC6sNAhu1cBrApCOP6SL/AVLpFp5pTRE5H7FSOnQ3Mqvdw+wivc8trvBRDAf
         qAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097735; x=1781702535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xGelfqpYfB35fDLv15ULStOev6jl3t5C08PX3tm+2Y=;
        b=JgA5eXl0+hMcyBvu1UmO/6zd28bv8msXmlfHR1dEJ4MdE7qDYEOshUSJ03PNPxfECt
         2fG12DbQBlLEQ0s+hFmpNRIdaQ5YT+QhbY/9TtsLYlDz78nObqaL4zMWxGZjDmULvl9h
         Niief441DAVVUgOvsYrQIQdwlPwh/irXRX1k60hvcY6xlgvZYkchA1S2hsU0P/Sax3aS
         t7OXYnsLZxVRhzoi11DAdK598cJj4NBvg/zSGh2l4MYttHppvWTpEF0NkfulZ7hSFehT
         638lQi8BvIB2AoCvMaVZix1e3EX7ed80qjR55phulWZhkBvxR2z1EyQc7Ig46pm0xn0B
         K7ig==
X-Gm-Message-State: AOJu0YwJKrWFLKDGVq7rXN17DjYIj1QXUgct+0eDz+LKJMWfCdMebjD4
	hURNq9FtWB5uvTJap8rTUB8P923l7ySBVu8zsIygkh3OastizixcVefwQ43rmbDx7F3x21OBEnQ
	nNjbZV6eWv5ocEQKfoaJDMHMC6caAPHwKeZeblpy1kU3gixgRAgdKO0sDzW9nf5L60SbtzGSwhN
	s6BIM=
X-Gm-Gg: Acq92OH9C+CyiCP9FlL8uGTsKT8WcO+9ACVJ8xgMIXHVlqL9tIJ398SlyrVO9cp5+as
	2zpnyu7+b2HXBvQ3zvDAFk3G8Q+b/COS9a6lDyoh+wm0fMLhgUrgQ/YOEmVTpYVrnNZQW6v9k+n
	1LRRKhiBFlE1bSIT8TL8FM/zhiPC4WSL9Ncs1FWSE8w7vS3ZNNNE0QJ/Dy4fxY2SwPNGU60UYmj
	Bt2+OyGGiiNab9HAaZxJKF3ISgksxq7Ql9x6Q7YuSCJZQpdWgQjBRoY8rryJZ3EN6Cc7/uB5nR8
	lgSVmLl37Km9KjiV0LqeBpBm7qsqPJkQdQclTiH0AeK2PjaZd0EyJ9bk0mtSDZrcl5Nst9Moow8
	62atNpzVj51G82v+U8ZHKwdjWHFoDPn8D5t92+nYzMDpiXviF5o1mMAHUFWZnqalFkM3OAt2yTM
	0ZIJ0prpZMv1W3fW5JinXa2D1wUrPwhZT8TaJKDX/ajQ3/ZA==
X-Received: by 2002:a05:6102:8028:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-6fef194813cmr14333123137.9.1781097734664;
        Wed, 10 Jun 2026 06:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8028:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-6fef194813cmr14333029137.9.1781097734037;
        Wed, 10 Jun 2026 06:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c2b9sm5388071e87.80.2026.06.10.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:22:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:22:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, vkoul@kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com,
        linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Message-ID: <rflqwagxxbebskp6lakuqtelbxfohcfanhtqltsafcrdnyvgwk@27dnwm7y3vqo>
References: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
 <20260610121824.111631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610121824.111631F00893@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX3DB+NUG2dxoS
 ug/9g9HHESQ9GtR3yr8Yaw+0xeXBIMLJEweKAbXx5PM1ztxkPVKLAeB21nHW5f9ZWhK/qKKtgBR
 k1ZOKZRcy1tY3J7Y7i7pKpBPSZQpW2P3K7KPhchn9SaZuopl+E8+fYQ6fq8OuJP3MZLjhwxrnPW
 9kAiajfWT2joH9GFGiHb9d5Uj1bPvulDxYOpsXz9e0RgfGme2+Cpt/sjRyC+bvsOZpFSbWp+DCi
 ZimJZLtT3XoHS5J5z3UCXaRQtMcne+lPi+JwavCyi0XsQrOuXu13Rt36ziK/POtE6nJry9E9c2Z
 V99KaZBnIoOGPjMXj+uo+pKa9lpV1MBEIikbojC69tHQQ23q1v+9lZBfKNtfDDcZ3D8i4H6xjla
 xE1YdYEy6vzhg0fJS1/rSsR6wss6x7Tav7Lg0IgEdxEsFPkETXsSsa2b3+l0nM4BlbX5yNKHaec
 mj5TIFA1U9P5CHjnDBg==
X-Proofpoint-GUID: haJ5fDZoOwacBJvVnrh2ZIWRwkF80hp9
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a296507 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jEOOaJWfrG8VwPnPn-gA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: haJ5fDZoOwacBJvVnrh2ZIWRwkF80hp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127

On Wed, Jun 10, 2026 at 12:18:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding the VDD_MX power domain interacts brokenly with the PHY driver's runtime PM implementation, permanently pinning the VDD_MX power rail and causing a severe battery drain regression during system idle.
> --
> 
> commit f3735b6dfcc42f0f55443d0f81c7b256532b0e25
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
> 
> This commit adds the VDD_MX power rail description to the QUSB2 PHYs in the
> msm8996 device tree. It explicitly sets the power domain and required OPPs
> for both primary and secondary PHY nodes.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 2f67e665996f3..b7cd1928335c8 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
> >  			clock-names = "cfg_ahb", "ref";
> >  
> >  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> > +
> > +			power-domains = <&rpmpd MSM8996_VDDMX>;
> > +			required-opps = <&rpmpd_opp4>;
> 
> [Severity: High]
> Does adding this power domain permanently pin the VDD_MX rail?
> 
> Looking at the driver in drivers/phy/qualcomm/phy-qcom-qusb2.c,
> qusb2_phy_probe() sets up runtime PM like this:
> 
> 	pm_runtime_set_active(dev);
> 	pm_runtime_forbid(dev);
> 	ret = devm_pm_runtime_enable(dev);
> 
> Because the driver forbids runtime suspend by default, the device stays
> permanently active. 

I think it should be solved separately. For now, let's make sure that
the PHY is properly powered up.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
