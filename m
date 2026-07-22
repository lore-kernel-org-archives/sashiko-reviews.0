Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8B343896
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726731; cv=none; b=sdstg757xGi9W2NNl8jexrejbZA0BoTIBZPj7FSl2/H/kzDnB492ObyQe4/DesZ2dfZnYEehmbu3AhwOiipdb/1TwxKcVBNgcwHCQVdQPqN8DJhY+2zSkJtXDYh4g9gZL8hzHyuAQMJd17GX6ZW/4HLsJhnNhqxFp33s/UYN4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726731; c=relaxed/simple;
	bh=4IieXXms1p1gfOioTqtDOKOk3guJJDfKS5sMIoBJoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAFkwc2/Lx+Lj09TCHSE1wklgh/tQo1/3/fYgRsgNWlt42o3A0OgRqfH2S8+FU654z9b0h6N/AJ9YdKIvxu1KfeSZGr4EIU34OZYpTnswByi7EJpyCvpn29H0KLdj7a5SbXgc62urdhZtfoXPjSjf9AkSADLsWMKwFWCRzYY5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+mOUJDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibrykV8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+mOUJDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibrykV8q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDHvoN411818
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=; b=m+mOUJDPjg2dm3No
	U/Kcv238LaxbZ3BRewptP/tvl5gaXLWg3EKWtj46QU8sLyhn4m5ehoqJjA74MGgb
	obKaISoQUsfE5Nm1PPOOUMvqs2MLPAXLS+8wg7wyT09oix3xBBNHWbfea0SPK9X0
	wnz6s9Pr1hR/sXJe57qz2V+OZQWR7ryebY+/c3l5xm62nSIQ9aiXeNzEl8tcFOa5
	FemrJUW441HlCn7JY97ss6qq9miZNCBnM5u3ZYxD4ZYjE35RUeprC1/gd2t0yg7B
	ri4GgjmMjmv4hKn8LaqMIOcdr23vjtEAuFwLBSfW4oXAL1Qg1V5+Eof3cBUuhrJj
	ywKgnw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgg0t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:25:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6dd278512so3044466a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726728; x=1785331528; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=;
        b=ibrykV8quFBMXdc7CHUqdMM7tFFCKq8rvDtM9ZWgF3P55DFD91xe+PWEpEJNKYuGYB
         cHpAS1czwpwZB1hfgoRohzwPoClMcMe2PXkWafkv1ZqlbnCh9HRdIwGJ9YDX5WO+8fnC
         KW0Dzea3c1Y58uX857HRzayjchlJcP1Mr7NZxrqCUduPkVmR6a4GPWS/wki8HH45qkkE
         jLiL9ksixRXhUCLbLJqHq1idh2IDQaCgXA5y63rM6eSFzsrndF4WW3fHisZ8j/XsiS73
         k8GRgIEGaaBD5m4foCnt0lUKo0b9c/d1hPqW0afvq2oej3efRLxQN8ooBU1iW04TV+KC
         VsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726728; x=1785331528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t92sHQ3r2Zo5yUGZYA616k96KB+vYRtuXV7WBIaLpwo=;
        b=mPhmo94gxfYAySDzGpj+iRdiiYbueyD99VRFrVPFASq4USKTuZFswOL+Yrbb+9UGHZ
         NwycrpVoWynoYBOcL//WD0+1xgZGfmACBy4lPobA66z9Iaj3gzYDRcp/e2EwOZj7z6WU
         +Mc4oZnFaUvVRvI18OTTQatxollsW01QWNDO5rPL3f9fDEWDFuIYNvyG2RL4JxP8ZRXM
         3tsVoX9MS9ePNWrfuIpvK33iDnoaxA8poFx7oclgVsx2FBhIVXf1M+APtDLgqfR3xjQx
         cMFIbXqogY8eXR8dl8GJhlkb4F8DATCqxeqA0LuHDMtRCeMk1a5iRRn00pGagF2ALLOm
         pyVA==
X-Gm-Message-State: AOJu0Yxc2MQVFMg8m/f+s/XFQQYuYp5ghhakBDXG+nRxYxfKKcoGmVLd
	RFmUz0p0Gs/Gehat+MTbS3Q+iLlD7O0i1gOqQnZ1/ooJ1z8TdEUY/nfXpRR2a3zQ5PEHLfC2FVb
	oIaGve57oTxMZXax2u3IPP5Ozd+EbB27w/ti2T6hNSjniPF25MqYAhvjr1Ut4XXIYQtp5eqUDVc
	bXA9Y=
X-Gm-Gg: AR+sD10eqEBiRevGp8vPx+ceZEIbm2k4nGQObS/KIxtv4kAKzK7nypqj77KMgAZZpk2
	a/Wzi1nwk/O5iyoxQVV3H9eGhjwwBOpqGv/5XQKFr1UuCcszOXJURF9IWELYFVpXzH0qI8L7kL6
	gsjbbH7lXkgLf7+KUgQeOT1SaCelfZOmNZXtvaNxuRs1limOFw8vsa8e/9lqbWm6RYzNw+72Uvs
	IbgUjnMlCr4FrsHwXlQEzEymEbzQ98ZXT06x0EJ44HneKOkXh4QoL6E9R7+u/UAOHK8Ak8Hg8oZ
	SLnKSon9n56UpdRfrWXOb3jRqXlUnHSjPRhyN246p8KCSrW352FPdJEyEYPKAaqEI85V5+FHyc4
	WM+VKO4N45LaqlGEtEI6leuaID0VMp0j4
X-Received: by 2002:a05:6a21:1f81:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c3adb11581mr26037676637.70.1784726728205;
        Wed, 22 Jul 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c3adb11581mr26037628637.70.1784726727582;
        Wed, 22 Jul 2026 06:25:27 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm9354845eec.6.2026.07.22.06.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:25:27 -0700 (PDT)
Message-ID: <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:55:23 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260721064826.903A91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a60c4c8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Fc8GeCVxlpIC49RtE6sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bdP5m12xOeDMO_aaetJCbC43rQz69awG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX2LggrnDkj5Yj
 6RbwhK/8CpmqlQ9OGN5kicRAC1XZffsxnTtgwEpdmRR70ZdYvEYczcrYqYtrwQuaLJxkSXXYuHi
 Z6tOfvK3JNV8w2XkBj219iRxxOvQdGs=
X-Proofpoint-ORIG-GUID: bdP5m12xOeDMO_aaetJCbC43rQz69awG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXyDsnEJzqc5UV
 XE1mS6wwdHbiA/pTiHAya0fe7RKusGWQj0WWCPcZxRAf3tiWX3LU6rNV65jy+l1O9KOR+j1CB4B
 pqwdSOv6rOkLrBt+sGL3EVQRNjZP0NEWcAmMpW0dl5mNsBFX+Epa0/9+ZW71jJYOxbm+61aQWx0
 6RPI+GidxlgiKXtxhJmNT1WMS/Kw21FJBcfnQ7mcpREpYKJcXLLIkZZh2+6d27qh1D8Dz0b7w6I
 GuC+yKYV/en+lQYRc1Dh9awLuksfHRl1aXUUSuooI1PgYUOxKXLFTrKAF2rPnYAsg40+j8Bd5gB
 M8sKIJcmyLYMYNJc8Y7soEsPu/F4Ir5C8LBOh4Pp4vaVJKTvVbvTvI83hXAART1XYsUFlytS+22
 oKbTuCmLhVvKI5k0uh1xPGKpoof6JkLpT45fG306x9nuvu3jYlaKzKg188WuACE6CF74XFmxXFz
 W4UBi8bq6kuyqkLqh3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130



On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Data race on `tmd->cur_state` between `qmi_tmd_register()` and `qmi_tmd_set_cur_state()` causes thermal mitigation state desynchronization.

this looks false positive, as the QMI request path is serialized by
qmi_tmd_cli->mutex in qmi_tmd_send_state_request().
> - [High] The `mitigation_device_list_len` field in `struct tmd_get_dev_list_resp` is defined as a `u8`, causing a 3-byte out-of-bounds write when decoded by the QMI framework.

will fix this.

> - [Medium] Current state is not capped to the new maximum state during firmware restart synchronization.

This is a false positive for this firmware interface. 
max_mitigation_level is stable for a given TMD endpoint across service 
restarts.

> - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.

The COMPILE_TEST concern is not relevant here. This driver is 
Qualcomm-specific and depends on ARCH_QCOM.

> - [Low] Building with CONFIG_THERMAL=m and CONFIG_QCOM_QMI_TMD=y causes a linker error.

This configuration is not possible in this tree. THERMAL is a bool 
symbol in drivers/thermal/Kconfig, not a tristate.

> --
> 
> --- Patch [2]: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 977e2b6f2dd6931cec0ac743a4bead6a6e561872
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> This commit adds support for QMI-based Thermal Mitigation Device (TMD)
> cooling devices provided by remote subsystems. It introduces a driver
> that discovers the TMD service via QMI, registers cooling devices for
> available mitigation endpoints, and forwards state updates.
> 
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index fd4d4ecd2df0f..5c38d598e4864 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -319,6 +319,17 @@ config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>>   
>> +config QCOM_QMI_TMD
>> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
>> +	depends on ARCH_QCOM && NET
>> +	select QRTR
>> +	select QCOM_QMI_HELPERS
> 
> [Severity: Medium]
> Does defining this as a boolean rather than a tristate force the selected
> tristate dependencies (QRTR and QCOM_QMI_HELPERS) to become built-in when
> enabled?
> 
> Also, since the depends line strictly requires ARCH_QCOM, does this prevent
> the COMPILE_TEST coverage from working on other architectures?
> 
> [Severity: Low]
> If the kernel is configured with THERMAL=m and QCOM_QMI_TMD=y, will this
> cause a linker error due to the missing THERMAL dependency?
> 
>> +	help
>> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> 
> [ ... ]
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..b31046241af8b
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
> 
> [ ... ]
> 
>> +struct tmd_get_dev_list_resp {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u8 mitigation_device_list_len;
>> +	struct tmd_dev_list
>> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
>> +};
> 
> [Severity: High]
> Since the QMI framework decodes QMI_DATA_LEN elements by writing 4 bytes
> (sizeof(u32)), does defining this length field as a u8 cause a 3-byte
> out-of-bounds write?
> 
> Could this memory corruption overwrite the first few bytes of the
> mitigation_device_list array during decoding?
> 
> [ ... ]
> 
>> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
>> +				 unsigned long state)
>> +{
>> +	struct qmi_tmd *tmd = cdev->devdata;
>> +	int ret;
>> +
>> +	if (state > tmd->max_state)
>> +		return -EINVAL;
>> +
>> +	/* cur_state is protected by thermal core's cdev->lock */
>> +	if (tmd->cur_state == state)
>> +		return 0;
>> +
>> +	ret = qmi_tmd_send_state_request(tmd, state);
>> +	if (!ret)
>> +		tmd->cur_state = state;
>> +
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>> +			    const char *label, u8 max_state)
>> +{
>> +	struct device *dev = qmi_tmd_cli->dev;
>> +	struct qmi_tmd *tmd;
>> +	int index;
>> +
>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>> +		tmd = &qmi_tmd_cli->tmds[index];
>> +
>> +		if (!strncasecmp(tmd->name, label,
>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>> +			goto found;
>> +	}
>> +
>> +	dev_dbg(qmi_tmd_cli->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> 
> [Severity: Medium]
> If the remote QMI service restarts and advertises a lower maximum mitigation
> level than before, will this send the old uncapped state to the firmware?
> 
> Should we clamp the current state to the new maximum state before sending
> the request?
> 
> [Severity: High]
> Can a concurrent thermal state update cause a race condition here?
> 
> If qmi_tmd_register() runs in the workqueue context and reads the state without
> a lock:
> 
> qmi_tmd_svc_arrive()->qmi_tmd_register()
>      return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>      
> And qmi_tmd_set_cur_state() concurrently updates the state:
> 
> qmi_tmd_set_cur_state()
>      ret = qmi_tmd_send_state_request(tmd, state);
>      if (!ret)
>          tmd->cur_state = state;
>          
> Could qmi_tmd_register() end up sending a stale state to the firmware, causing
> the remote mitigation state to become permanently desynchronized?
> 
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
>> +	if (IS_ERR(tmd->cdev)) {
>> +		int ret = PTR_ERR(tmd->cdev);
>> +
>> +		tmd->cdev = NULL;
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> 

