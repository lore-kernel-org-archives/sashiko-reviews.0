Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B69647986D
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158688; cv=none; b=sOv/O3oEvz/jtRgAxiQMKM6NRMQM4IHjuqiypV+jVMuhZg5rgPO7KqQoRtE+EWfYKSzhlmSODk5TVInRjhToljeWiUbiHuM63ZZGM3o0GsRStawRCA4ZDHlxroBcbnpnMTJ0unjo14iiJ44oBQrtzYHjLIoH6KxpPD0vMNlTlbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158688; c=relaxed/simple;
	bh=ZHN4Tker2MNfZG9wdoWMQcO3v8MZgFM+Tpk8wzrX5D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByXue3l3cSjU6zUG4p2r5TE933cE0L4Ivl4UgW0SXuu88owwmf25IoUc524V4g2fb8PHD3eEjAU2XJrvHzFj2Z+03Che0xqTjagUyFZhzmsKPocro67+9qbQTi+ZiYAHJLqmEL0H1grXjET4fzG90X7/KEGgKlzeDOX3JrsJZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6CKv2L/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNpFUxxO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6CKv2L/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNpFUxxO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2ono2821380
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=; b=R6CKv2L/vSZ23Y2S
	y8QgrZsB8TjZu4aYpdzGVCKF8HKl7lehL7ukn06mgQUVEGRbzC+WLyYExsjhSO7j
	qv3N5TDs2WDt9EYfh5M13VubtATAUzHlyFMuHtLoown2f76ZP1bQEslvu2bDeYRF
	fvOItzmqY8faf7vJOjEpbSp3Tdy+ZvacXFQjDjq741IU71wPPMbGPuZ6YkXTyE8K
	9Nzdo507FlIXN4EJ6r4E+IWEA2TDV+PC0mZPOk8sE7v9mvVl5HTzKOAchjKnOw9f
	UdU12hQB4pltp9DYeF0TtopD0oi5A/AVNvTFBYvKytZtPShWZkPYIpPcb+hvEy9l
	LqIcSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwar9km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso1294920eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158674; x=1790763474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=kNpFUxxOHZuSOounnPW4gqEU03rOxNHE62wU1B+yCx3fPvGhTLaU7pzzzWj/sYTXa5
         MIitZsZhWqadBdMs4+bk4uxa3jabo0eIX483GlJbexO2JDd9yhGx5+XGEl/h1xdkrmsB
         qtRoIUfexQRwLO/dEerLTKhDtUaUCtzorG1d0v7m+/xK5OmaxJRxHTsyQkgnj/tHZ5nP
         hVISlISlq76gNPsuh9aOws/gjRXlnNpAIWfKtb2rO2t7U17OOeYy0cP1XnisOu4DHD7J
         oy5D5tmAvZKIBDXFDZt/8nc45+7JLZQqPcjvgAxvV9j2k/rIjGHC+USwZf43Q+N2qQB2
         MXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158674; x=1790763474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wH8eQDj3EA9819Bp4VXCSjFUXKah/hZ7ik3hLNtzcs=;
        b=hmJsxddOgwOGmIOaZzgB5vgdlBXfbGPIz7jI4KNXyaiXi/gOw5ZJENio3h0EtRZszh
         Dxr+fqcYrvi/hOrNpcv91N8nFGOs/pIVj0QAYvzWk6HV3MKpKLCzI7fxwlcPedp4PP+0
         NSIRTE1/H8tkI3FZoVUjqzqrJudt0H7EuP5ITmApLXSD9aJPyFdMA8uKHgDtd7v0vZDW
         dor6iwY8gT49mE5I5A2CXFt2qqTOSlgp32GalKXdsBRZBXu8s7/VqwwmmwUxjXvNr/RB
         IU9/KaEBJMqZpRLcw3hDPBxu18GaU0OOfMLqp3Q0sNK+kZPgsQW/mAUphm8jGTUDvXEH
         SYLw==
X-Forwarded-Encrypted: i=1; AKwUvByn9UjF3tO9WnWgUmevvyrza+rNm6UV1i3PWa7Ui2GwecRSKpAx0rfuYlPL2LkWa6Rz85JcqJUcagmIQjVLtv8=@lists.linux.dev
X-Gm-Message-State: AFuF++lA7CQlMRQ/INOPpqng8jASmBVbF4Tk81u4e1AqpzB9P3OqYJeK
	DEkjJFDfh1lPrf5QCoIePwvNqMVkIPhgx8QW1m8jgWoFAHW94xy44GtapSlK0+lENBPlLyx0Uw9
	ohsjviwNMjSjSDX2f415WGsHv9dC5vFhYZmx7Vt4Cex3q0SjmwaMbvt7pmMHNftt1Ui9zbLw=
X-Gm-Gg: AYBFou3whISGc4x+8UYVGL5NeF+Tm9bqCHoQGz5jZJS9CEWcLYkadJ8R7zBG6aweYa0
	At3/chyVu1Wi+oGINtRSkBeM3SyZScLwB2jN2x6rx2Wyqu00I8v2QLMvklOJoTiuxW7BJBXiIZt
	7Zjtv8QAdTayOZpSDrzM4hC8exQsdQ07Df1wGM+VyKydKqcCOZ1KttXP6ngCwLhmZkkscymXsp2
	x7ya/VgRsB5vIqi36sREN1nt0TpklUvswWfdzzlzZ8x5Wl4NpAOy5Qqj/xje08cbW8Q8esfVGFu
	6D6yMsD1h5kgI9E2TbbrmutrfqpV/xQ7WXbfnEe/ZfZlmJbx0H7mr73r2xIxGtETTY6nNZERRdH
	DrE3tncO3ijKH84sXFcHTP8uHOAKN
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124569eec.13.1790158673598;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:3a9a:b0:33b:b3f0:fdef with SMTP id 5a478bee46e88-33e8c05ffe5mr2124552eec.13.1790158673077;
        Wed, 23 Sep 2026 03:17:53 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:51 -0700 (PDT)
Message-ID: <41063e57-d8d9-43d1-bba6-f17f667be867@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:48 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
        robh@kernel.org
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
 <20260921104237.GB2348773@google.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260921104237.GB2348773@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX3h9D0IE/FQyt
 gc94A0/VW/p3raUPU1ix0pQrdRO3ye9ImTrx0dUVCdqN7RcrFiO0ome7z5h3qNI9EsB02G1hEh1
 cF0eH7Wv26bvR8XWGolzzXvSdCw52PBLRLrqJ/DAnapP/bdDzp9mKQ52LgNFXL59+aCByWP9F6r
 ijyACQjJ5MuEzz6QI78DkHsvTUXpnmTZfZ6zMci8B9DdByUk3AwwWaB9QAh5aN253C9eWh7NBsQ
 zP4D5lOZSeLMviBArcV9cFzCiPg4B/L5czyXIH9DxSKDDV+w9qTr5no5g66NgS3CX4tyJ6zkYtm
 kQfKdxbAyl64KeuKmPoSextBYFZrLGMjaCer52Ek8uSmIi8Ta7hHinS1XKh95WDhGsSYnTHGi5W
 95zYGlvUL2cZSZBWkNov7X20IqYqTyZSkOhOLodckklytnpvua+1aRcx0s8Y6SbCB5CVZnU/CHR
 9zwVUMg/sa69GKP9wyw==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a752 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8XOFi-LDWgCnIeRtGYwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Lh-r0bfYzEDXXoxMUy10b-c3UGWSsL0V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX3f4j0Ia/9TcC
 qsI5iaVbovEtUJOmYcZNBQsCX8grSrnUUtDAHtZFLr7MjYq3wEck8Ar4/OcR+q3ZY+/UkrptNg8
 sBuXIFI8T2TwQFaYv14Ot2rXLr6GODQ=
X-Proofpoint-ORIG-GUID: Lh-r0bfYzEDXXoxMUy10b-c3UGWSsL0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

Hi Lee,

On 9/21/2026 4:12 PM, Lee Jones wrote:
> On Fri, 18 Sep 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0
> 
> Please review, explain or fix the Sashiko review(s).
> 
> If this is a set, this request includes the other patches too.
> 

It looks like the Sashiko review comments are all genuine, I'll
fix them in the next version of this series.

Thanks,
Jishnu

>> --
>>
>> commit 2c273914596163e5696becde808ceb33d98f0fe8
>> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> mfd: qcom-pm8008: Tolerate missing interrupt
>>
>> This commit modifies pm8008_probe() to only register the IRQ infrastructure
>> if the parent IRQ is present. This is intended to support devices like PM8010
>> where the interrupt pin is tied to ground.
>>
