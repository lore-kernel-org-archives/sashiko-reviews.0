Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D971A6839
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455300; cv=none; b=jLEpkQv2YUXMLXeV9sDyiRJJI0eigfkSOMWsgOMJWDsD/qGWaaB99lOoTqSLR13/VTySEBb9BbMS1Cf3MPgd6uZvltM5tYSKqrBKawv/SrkERIVaKqp2ZNSAl2h7eXOwCDz+8CskQaWV9Q4XaDt3v3RYdMG4gf/UUnen2hqSGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455300; c=relaxed/simple;
	bh=OrukJg8m46sj1Pu8mW6Du4FkCv/lEs0V0+4sCQUjoAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0ruz0B1C8tbOyqqn8OYgVr/akDNI3Wo007QBATHtPWJGxXPJx4uoKGdJlJ7RuK/U40l27UdGk3j/8eV8d2BFGRPHb0QgN1GkEQQVdH6hMwXhlCOK18+hSYlSQoWKW8fp3lZFpW9Km/GF+eAVrGLQal+Jk5MOMc0/brQ1Mk1nng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHFmoVU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRgBeOTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHFmoVU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRgBeOTW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCNXs7779220
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 13:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=; b=VHFmoVU/Ssi+h4ke
	2Yud1BoX2w7H1GNDk9jhpRH7icB1RLXDxZ45ptkgMl3+x3381MvAbws8CQhB2Cy+
	rC4yvNQt4W0VeHR4PM/39ljBmA+YRyDa/wTKqVR6mztau8lsgnZWDRXvMzz76Wiu
	usqycIYBcaWF8Y3QyCNgxZp6PTPh9+bGtKmt3BrcaixpyEFCLFj4hyFkm/R9FBnx
	Wwfr1HR6vLzAPOXxVThafyAbiXpO+2IeWhIcjg7qit1zmaohL36/Pp8TwJrIGheO
	1gS7Ng3aWrvqAztxdqhPR2mnZ+r/YNRtMsyZUYeq2aeApoaTP9F2QPlmRafabxVS
	LD5yaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7attvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 13:08:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8353b042152so9189768b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455297; x=1780060097; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=;
        b=FRgBeOTW3qhnNfkDVeeCEEySrH0N3fCb7EbD3hJa+DCgFUl/SSx3BO+ZzE8ZOTJFST
         MiHqLbTs3mZhQ4ySl2t8gO394/251CwQDKb51FRy61ti0h+IxpX/kp2T8WigSqfj7uIj
         07aPwdUn/jMThSwBPpjoWdS7rPemTjaxjk+JBzdcuIg7cPssA32ng4U08+KqC/BtxqKQ
         U35sI51rHw3KxSVmwY7XgEnJYZCYgyEr3+ibTafhOA1mJWTiQOa2GWVonJ0pKiAeqYhj
         OcLnRviJK5vu+W/AOEKUz4UjEljXwiIe0kPI5YM5rc0X0ZDNzSsBioKRSrS+fOv5k7ms
         aYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455297; x=1780060097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xi3o5QDtxodOA7hKGtfvSi8vreN8UVFATY7/epF/EI=;
        b=jS4lx8oQnMQCHX13ZCwUafixWGxYqzpvfQEAOkvFVYg2lwOiajS7a7CiK7/T4xPRsH
         WBbchHTZr6xY4+eQ+lH+kS9Ats1FZ3bJupuSmCOuJB5jm1a9TuKVSyKIGIoXHroZU9GS
         hukBIsyAIBKOlRaJzMzYLDPwwFWh5EWgSZ6/shPJdUH7Dy48IP2fmKGfBETb6XcAnIu9
         6GYkxLjde+VXz/yn5yJTl8IMo4N1gW2aQTCN42LFzWJpUtzFbcZTXlQVADPIpR47czUm
         B8iErwXES5Ap9jc2KAPJTKq4htnj9lPRLEZw9IE15e1YmRxVBefC8c+VBYjsEfAKP48T
         eZmA==
X-Gm-Message-State: AOJu0YyrH6Ymz6qNWaJ04OxZZYeL1lqVll8huxl8d8ZOtqaZ+jQbwTL0
	L3YEPvAkviGhcBl5V7e0seP1VPMVdQMB6C2SrtlJb5XUVpNezG5k5vf8i1y6xmtb4mtVtNPLblr
	mF0VmiMkWeo4noeCSZI+ffXMlqaV/7QLeiyX96iqZ84ZbCcTkjg9XyA3jbb397+vrFaMJLx/teZ
	RhIRM=
X-Gm-Gg: Acq92OGHrN0fPXM6t0Yi8OGz673icb9ZkELRpjkJi3YxHRXsp0Asrj1whaNLFXGvkzB
	KiYyuMugCn4WEp0DN2b6ymrXdK83Q0LQklbFAjlCDIkbsLOd69tJ2/pIaJH7Fv6ICQ+MtMoeWHp
	8Tsyfh0P7kI6LNhQjDX7wukMJnT4vfuFVk0W9e0102WjCd2q8I4TStViP2F2ntT9KqAh0mJjnJg
	+uduLTzpAzZpZGpfrdi29vwdDoTVJVwQ++C8VoBxfE66An1R/tLKlrn/twPnwlPvBa9SiZKOVRd
	l6j25h/uQB5x5yPZEX1Irh4e4XzA8CpaiCvlhd53rLL5RfVPhFkn7inVg/HWr12RLSu4D9AMnKj
	ZI2VPEjmZ13Z2bFol98fY2DWyHMxjd+TvL5GA2b5OjIN51VpU
X-Received: by 2002:aa7:9a85:0:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-8415f3019a0mr3899229b3a.30.1779455296657;
        Fri, 22 May 2026 06:08:16 -0700 (PDT)
X-Received: by 2002:aa7:9a85:0:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-8415f3019a0mr3899184b3a.30.1779455296159;
        Fri, 22 May 2026 06:08:16 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1af1csm1902328b3a.27.2026.05.22.06.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:08:15 -0700 (PDT)
Message-ID: <ab679636-a15e-4876-b658-7534484e337e@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:38:12 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
 <20260521135659.A15C11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260521135659.A15C11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6KrxE_ugTD05YYhf5mQ3hHkVwdF5XayT
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a105541 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j0AMz7HbSoZG04DGXxAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6KrxE_ugTD05YYhf5mQ3hHkVwdF5XayT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMSBTYWx0ZWRfX+31kFyRb6nnk
 uHUMZoUbP+e/QeH+nIg11/EwxkUuxsKtCDp8E+90eW2OZNEToklQ/DoatzjW+chFXQGa8ddgsWN
 RiVbYQD2QgyRRL8Do42ud5t4c7ENguAQwzTyGYyJXbeP2hlyXaBH+SS5kvi/NyAAaVOiWuS4XCn
 RYSiIY4A83H9s7y4fjKmrRQvwgb2EQmvSXDphdX3nICSiVl9+zw7ds/pGD9MV4okJSzF2btpKdW
 eQFmF4w0g2dc2k9rrVUyScYa6NQGY9LYpxAx6IAsDI270pKW/AMr8STWzni+UT+J2a6PN6DlmtJ
 oMcIKF/q15nS6jJzSLNTU0S7IkWQWoxV8z0ZYtk+wtLJ5bVXcCTmhFh2vIdHzQcEwkomNgbvzdi
 /jROk/08SvLDGbeys2lH1KpBIlKUkbLNE4ySJ2as7PMO2LsSAOzGLGMxicLrCEgjFop7euw31El
 P2wr1FfVjCQ0Fb1gMPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220131

On 5/21/2026 7:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `ssctl_id` initialization for `shikra_lpaicp_resource` causing graceful shutdown failure.
> --
>
> commit de542ab4b48a2146f6973ba793bbbd6328de204c
> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>
> remoteproc: qcom: pas: Add Shikra remoteproc support
>      
> This commit adds the CDSP, LPAICP and MPSS Peripheral Authentication Service
> support for the Qualcomm Shikra SoC.
>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da6..0101f1db6458e 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [ ... ]
>> @@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
> [ ... ]
>> +static const struct qcom_pas_data shikra_lpaicp_resource = {
>> +	.crash_reason_smem = 682,
>> +	.firmware_name = "lpaicp.mbn",
>> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
>> +	.pas_id = 0x56,
>> +	.dtb_pas_id = 0x57,
>> +	.minidump_id = 0,
>> +	.auto_boot = true,
>> +	.ssr_name = "lpaicp",
>> +	.sysmon_name = "lpaicp",
>> +};
> [Severity: High]
> Does this resource definition need an ssctl_id initialized?
>
> The sysmon subdevice is enabled by setting .sysmon_name = "lpaicp", but it
> fails to define .ssctl_id. Because .ssctl_id is uninitialized, it defaults
> to 0, which means qcom_add_sysmon_subdev() will be passed 0 as the QMI
> SSCTL instance ID.
>
> Looking at ssctl_new_server() in drivers/remoteproc/qcom_sysmon.c, the
> version 2 QMI service binding requires svc->instance ==
> sysmon->ssctl_instance. Since modern Qualcomm PAS QMI SSCTL services
> advertise non-zero instance IDs, could this cause the binding to fail?
>
> If the remoteproc framework never establishes an SSCTL connection to the
> LPAICP DSP, sysmon_stop() will explicitly skip waiting for the SSCTL service
> connection since ssctl_instance == 0.
>
> When the DSP needs to be stopped, will sysmon_stop() bypass
> ssctl_request_shutdown() and forcefully power off the DSP instead of
> gracefully shutting down?
>
> Forceful shutdowns of active DSPs can lead to hardware state corruption
> or SMMU faults, which often cascade into kernel panics on these platforms.

On Shikra LPAICP, we are not hosting the QMI SSCTL service currently, so 
there is no SSCTL instance to bind to and .ssctl_id is intentionally 
left unset (defaults to 0). In this setup, the sysmon SSCTL 
connection/shutdown path is not used; shutdown relies on the normal PAS 
power-down sequence.

Thanks
Komal

>

