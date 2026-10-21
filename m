Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573074;
	b=wOrmL89BTf6/+oGF9YiGldnJZOdQZg7q0HZxwHcg2EdnDdsH2tUuA0N096Z1pJLMVD3F
	 7uFlg/5KUSXdQU5WiZDZkhqsHcxAPsUGSEEAvxFBdkjDhRK8+eLfe1CydrwEAxaQphIWT
	 dYDP+03ZTD3nVscG/vUKq7EPsIamd9dIU8gX2CCSSFb7xjy0YSL75wP+dhh648XI7cE24
	 9Klt1WbVpEBP/UjJMvsprIjZRV5ufRgHg5taSwQtNfah+dAgMdFfyGNm5YHdL1+/AydAt
	 XuabQt0xCd348yJbuDZXEbYp+lLTKMRekKrqPaNNfH8vcVObPHNm2dQyanbpcljKchQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
	b=eAoYZxWdnhId7nBqxWPUUGXNwinPtyduB8dfREurzlQvzztZe+2H6bSL/NlEHcBGWA6m
	 68KgvU5PPs7zq2YOTSQa0MGKZ/wpSg/wy7avjK8+rl9Q8nCahiTGpNBUajIr7lNOA57ju
	 lziRTXhck/wcGt9zm4Z89TEPET7ggOnrd+ZivCgNFondAFN30AJ+olEkz/+nxJah4acHl
	 Ip36T8jTeef/GrnJVzrbz12LmVDwmLYmiekzx7jkQPvKtCkcD5TchESBdy0CNRg+qcXXj
	 Ad3Ed+DyEZUSVxn5v/DYqt3eGyC1YYMfc3koTWrRp0VO486Q1ogRXA9ImahvnqL21+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJgLUL0l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8uuA2st;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66470606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 08:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66470606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJgLUL0l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8uuA2st
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2eA3926577
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 08:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=; b=OJgLUL0lZzDQy1/4
	zf713iFJ8apkpA2+yOO1loGARBBzJoeXZ6DLtEkYwK0ck20lrOH1OZQL8JNGiOTA
	Ezan32mStR8xqHcFxU+gmORjcffeOCQE8uVEwTAUBbdtG+gfqrKEC3Y+3RXqE94q
	l+7hvgF6t4HeW21rr3Tr7c2rF2WKlHkJCNxr0jsoq9VVTmWrkeovQVHG4uOYiu4r
	Hnn0ehj+Q3s+CWltTyq4tcfX28+N7E8bn8YOmdBDreQrI5xd53ASchmpC3uCCzWR
	sX0hbj3n9m4Xej2noCJZD1HEt17cU6unOzqn3vQdpSCKShPkDF/KkL1sT/4pEUCT
	ERjJoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2cpuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 08:57:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1905738eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 01:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573073; x=1793177873; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
        b=D8uuA2stxZO02kwYRuFqvpmzzrEs2kiiIQNk7BgYXRpmaqcUQblCNBMmw6S/lw4jlL
         P63WtuLxgRJsP0tRjwavYFKWWTI1I0LAmgD3LRtsvucKdDjq5Jaho0vvZxceqVAvAJ0l
         OpTMqWhR07Fy3NfCLAbgDY+d7Tyi3d2arG04KISKNE8oMw7oCw6OkhgHNd6OeNcRHgJ5
         TkjgbzdGqz3Q7BhFpRB1xF+Z6/YOgtpK/3mooWsaYx59yBp/T70RUuXgmd2Q1Kjtz1eq
         wLS8OyYzWtH0t0sgHAzXt0cNounphQyUNWNYdsXdmi10TFHfHoDwEphPUFS2wnI1muCl
         MBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573073; x=1793177873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
        b=Wobre1JkUWEHe0F9cAnhMHgAss4x9B18R4mIg3WlodM+I/fsVc91rdOJUQssu7mUwe
         3iUK4aKOWZiWzg0/7/B5HdI9sylXK7goPH8S2u/6fbrs05ZhPXJMh+Rexi1YEwJ6AG3b
         S4b+aMkaYZQGq1bOASfaX85IoalmXvMZ5zN99nIqISRbhiRoqrJhV6eKDgmwakjRJx8t
         T8QhMsgJ/jjMNZyZ8LpkJxoJ8GiZqL5/cgksd4d5ygi1r/0AwIQpH4m2nTXLI35QWoMu
         dVtS56GVnsX5xK7OBMCNYhx31uG4/0Zk1xo5fR2uQhFTjvcg3YGN+E1OPlk7i84XQxO0
         xYvQ==
X-Gm-Message-State: AFq9FYK3Q5mA8eWds9j0jtSNkldtWKu7Vy35IWwj9fyWSDTgD2JivnSy
	DhWXOJNg8Dj07loQLXYErvRfycL7Vu7/4vPeo9hS9k9j/MwZmvhSH8Q4cpI4vzBP1FcW0kDQPgp
	xcETIwAvnvvY7oDqri5khxAx6RFBOkkNPLF+QyhkePtUQ75Yw1YoLeLxGL1pMc6MI0xDwpH6OsI
	4k+tY=
X-Gm-Gg: AYBFou3AgqXon+f+mVdDX3n6Y/rxlQn8Yn6qtDxx73CdZmpaVUF1KgD+4jHalTsmFIn
	4tzaVBFh3ergsQqBjkdiXDknVQ59nNv5JMhCoqfsEmOQT4/bvUciDhQ1/ZImpu9FwOXoShu0BXX
	PHakNbTfmnOd9A/MMYqGfgwQS58GOpG1Z1w/KUS/scv6vPePA6aU2n8TXALnYE+b1JTEwx3AsXt
	glVxn723ISy6UJH1ve1jdNl+EMB3cc4WmRri6Fjs6/01MOxHoYBr2cAupJXC6as3qqhTv9LNcxd
	EvLfGfoX8WLuvGyJEs3NDoJqyWEazhYvawLtUQIcSABSS8PZl0OuwtQ3MVYESokcrC5YyvBFIGc
	Y1fgOEeUlX/187oMRj0aJU/6Ca0o0nyg=
X-Received: by 2002:a05:693c:88c7:20b0:366:846a:e21d with SMTP id 5a478bee46e88-3674ef200d1mr2486977eec.33.1792573072692;
        Wed, 21 Oct 2026 01:57:52 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:20b0:366:846a:e21d with SMTP id 5a478bee46e88-3674ef200d1mr2486941eec.33.1792573071922;
        Wed, 21 Oct 2026 01:57:51 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm5976131eec.9.2026.10.21.01.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:57:51 -0700 (PDT)
Message-ID: <147d2906-917e-4e77-8447-085a67b84fd8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:27:48 +0530
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: sashiko-reviews@lists.linux.dev,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-172176@kernel.org>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-172176@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s9oGUwWb_VW5Xzf8QYDq4f-H1Wpx-Y_i
X-Proofpoint-ORIG-GUID: s9oGUwWb_VW5Xzf8QYDq4f-H1Wpx-Y_i
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87e91 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cyixkC-7dOoUwMZJH6MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX9vvA7/YfszD2
 sW1CWl3cYKQ9sE6gE66GBW9/IeF0+yH8i2cCnnDm0a/f86EaXgWr6ACVtI06eyRu+0bkengse+s
 xZ5749VXdTd5c0ulhYHoUev/Lc+gfq0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX+PGwoNyuuzwJ
 pyXWrs8jUENQ2L8hq/MEKulEoWwnll8eIG/usBkpfw/kXw/BazTquf7rnAb71E2o7elX2x+qIy3
 QGxUvsAjqzqhYcG9O4EkbMyv9IMuNHCwMDTflRJH2JcntqeZm+NA30bEVaPWJS1SWaVwPBMyJFg
 LFkLg9sCN+wb5Pgt2nM6pO0mjgHlgYvVb5o2j1vcRwow9NW7zi0Xx+cE4a7QAV3W8Qh/IBVwqAN
 Hdj/fIf4tLWxPMDEO9/1D1DdUCildQOPgsu/550gJs7zzFAHAVdMGyvVkcoevAZ+xXCmiOdboDd
 FcWGz14d7OoVAh+UhUDVWFQvW6Nus1qUCp1uxE833tWDU0cS4Cs//F4Y+/NErXCx3cWD/y2Tgb2
 CSuLYAAjnlik4kKZXZdFt4m/aClKiF+zyFxokf6crnnmrVP28bnC+ALs3uTSxO5JD2W/nLm705v
 +C5cBBL1MnnXhQNIgjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

Hi,

On 10/15/2026 8:18 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dts: qcom: missing status = "okay" for pcie0_ep and pcie1_ep
> - [Medium] dts: qcom: incorrect polarity for PCIe EP wake-gpios
> --
> 
> commit 3fa46fe28ef2e9d52dd0b40b57be7d7192538595
> Author: Nikunj Kela <quic_nkela@quicinc.com>
> 
> arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
> 
> Add initial device tree support for the Lemans SA8255P Ride board. Enable
> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> zones for PMM8654AU sensors, and SCMI protocol nodes.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
>> new file mode 100644
>> index 0000000000000..4273f47c3dffc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> 
> [ ... ]
> 
>> +&pcie0_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
>> +		    &pcie0_ep_wake_default>;
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> 
> [Severity: Medium]
> Since the commit message states this patch enables the PCIe EP interfaces,
> should pcie0_ep include a status = "okay"; property?

This needs not to be enabled by default as PCIe0 RC is enabled and both 
cannot be status = "okay" at the same time.

> 
> Without explicitly overriding the status, the node will likely remain
> disabled as typically defined in the base device tree, preventing the kernel
> from probing the controller.
> 
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Medium]
> Is the polarity for the wake-gpios correct here?

Yes.

> 
> The PCIe WAKE# signal is architecturally active-low and open-drain. By
> configuring it as GPIO_ACTIVE_HIGH, the physical pad will be driven low
> when the driver intends to initialize or deassert it, and high when
> asserting it.
> 
> Could this invert the wake signal and break PCIe endpoint power management
> wakeups?

No, this will not break the EP power management.

> 
>> +};
>> +
>> +&pcie1_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
>> +		    &pcie1_ep_wake_default>;
>> +	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> 
> [Severity: Medium]
> Similarly, should pcie1_ep also include a status = "okay"; property to
> ensure it is enabled?

This needs not to be enabled by default as PCIe0 RC is enabled and both 
cannot be status = "okay" at the same time.

> 
>> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Medium]
> Does this wake-gpios configuration also suffer from the same active-low
> signal inversion issue as pcie0_ep?

No.

> 
>> +};
> 

-Shazad

