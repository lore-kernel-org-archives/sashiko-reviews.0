Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0B14A60F
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475140; cv=none; b=h2WNvNH9kqTQuvVb7D5SbMfZXKUkn9n5VBT8pVDoc55pzchiRJPvBLsDXwoQT98xCh2cWn25mtuQrSyuoFc9OziFHdDcNtBJjFuSB3St47oCIZua9E80Vndd1GsfTeZypY3J2xHt2K+R6TofW2S0lac/7o6hNfUdrldKuPvqOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475140; c=relaxed/simple;
	bh=EKrC2N69slWRV+1zTBKx4qr5qT53tyj0KhdXucCIoas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4pxqrbcmdiujryaqp0+6Z3WYSDCrW/4+osZ9+XUc+kodoTGW+eYhD61cNU7hIG/NF4h3cS2W93qGT+XWOFHH8u48JfbQuSK+q9hmKtirZnQGcrDj+OKE8lyaaCnCEH32vc7tNxW3Op1jzZiTtqVfDHh/uxQg52jWq/34GYPwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3xzyvNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dL2Zx1EE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3xzyvNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dL2Zx1EE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5ANt63509218
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 05:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=; b=b3xzyvNpUXT3NtbL
	G6sws9oXKkGoIUc71QfaUSAG8/PFKRoU9oSRjivSEDrNXOzLiSgykwlVRplW3czu
	IzbLPvaVtfQfFp9gQYp/lhQrrMmtEclakNkBslOxKlwZNzQbqnDBlGH/sGUQk6vM
	+LeXVhRpdgVbhEep7FHuOvEnpf4DNDHNV8BnXRlkmg4zNOP5FNTa/XXp446hg8dQ
	etAG/pRX9/H7PtH0zZhGpi+pIOJokMdNokFFy/K4eDxk6YuAVrOtK6CHkdpMii/+
	+sqjXFxnpIEJdTyvVRUR3O4np2rreVYLGhTRp/8ibv7MfXUBk1hC2jPIE3X5dPBm
	9mdCHQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnavr0wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 05:18:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848474825ffso566460b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475137; x=1786079937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=;
        b=dL2Zx1EEBDl43q9CAVCfWzcQjNtVMTVOe6vZuL6ItBFKPsrsYla8n8jp+LzLHIkhbO
         q6h7GRnAjrkYacO7yG/N4Evf7s4gZgitTuEgGNs4bCrt0ljmxxhdO38tsMkuTUekvM7j
         LbD0ySeZBNo8zTcshv4Vbgg3TjQVu9dvVxIILFs7pmTIUXSlfasOa5GdqPR54t66ys06
         qhUIf+gBlFqME4Z6FeNuPhs9YPN/bZ90SPDcy1tZeAejpPAyi7KvSU81HY3fTOmXBaNZ
         tpxuQ3gNDqwDeRE79IpGO6tK9vT4gMGl0zaLadAAz/FtEgfqX14YTBe0l2qB+Xa7eXaJ
         WDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475137; x=1786079937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqHpntgDWShsVeoIlxGT3A5G5OtkzJko0fr5r9HJAts=;
        b=d6HNKOe5+8yeHhmmTqYBHVPMgzUUBHPTuqDomL0sbAZCVWngBG1aTd+ZT0V9WcqvtT
         Ng34WuAEVJh5ygCG4hxFJxGfrLsh+hC5WS4mIceIbe8tktLqH/xR+CZ/dFJTMvW3I072
         QTWAmOEtNJPCoy6CnolVsvArwjevEgUTQwcxohlhMxM396T5U/45vAgM4yUE0Inkd8jw
         fG7du5eEb54OZY2IGlZ6anmysMv5PDUVhm6O/oG1WneAEVHNAg4dHjD5al2DDyjMWJJ7
         9TZ4HBMevOVC40WrNwEB5CpNZjDASuOFli5LO3fsHoCoMFMXQ+oNn95ThD/uFTK3ggMT
         ZRdw==
X-Gm-Message-State: AOJu0YyUNt+EMIj3GhK5KDppFlQZFjweztoQ7rX0uWu/uhZGBN9e+PJ/
	QyjiUbec6GOEhZyI6ByyXu10QyD++82nEIvcI1XYLTIvoqUfDFZMTjxefhgexyO9iDHoHZHsLXy
	oYC8zXP+GL/VzW76C7zIkp2yhF3IAp+HS3d7f0vwep9k2hB6wx9JlF+5lH8P/Mib7unN+paaco2
	He/xA=
X-Gm-Gg: AR+sD10PG3V165s7/uEjwrr0yESINEETGzJZkwkJhuOFfl+r+gS1YNkOYrv1rNjKH2F
	jERDOEGUbQKJ67SO0G+YVrCMmZNIF8AV97VCiNCI7TauABElfdS2z3LyQQK2r/4Nla/ksD6v7FR
	8BwGktXQ0SXnSXaECeJe6E4GNn2ag0O2BDkcMeecA/HBHDQrD8M+2KU1Sbb+1imqLFN9zSx57SG
	eLvyNmbxHKFmAZx2yx+DNOHczxctIZ25fbkE7akqJjV6zrfwC7HOTeB04d0+QmlKpXJC1JbTOLx
	MEp3Nz55uG/4mKX0bfkS79/fFvioO9LO/H8/rpJlRMTj56w+P8kdParYrvB1k/UzcHbOIjrZTG2
	VN1GnOTO3+VPYG0BB8hp0N88pdr6pGM4=
X-Received: by 2002:a05:6a00:2916:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84ed7c3c161mr404873b3a.26.1785475136776;
        Thu, 30 Jul 2026 22:18:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2916:b0:847:8d0e:5d83 with SMTP id d2e1a72fcca58-84ed7c3c161mr404848b3a.26.1785475136109;
        Thu, 30 Jul 2026 22:18:56 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5dac09fsm253593b3a.28.2026.07.30.22.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:18:55 -0700 (PDT)
Message-ID: <8aefe4d8-7d13-47ef-b18c-c3db652b06ae@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:48:52 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-2-973cd3a226af@oss.qualcomm.com>
 <20260727144005.F28421F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260727144005.F28421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMyBTYWx0ZWRfX8W9NCUiyV26S
 GHDyqB0m4SZJNEJLcYonvUm2VqxK75fG4WAcXduF+eoObkf3rKOjwLhsxJOmGbsDrPjH8cM/t3o
 HGNJrD3DxhDn2VtnXZQK0cwzK48/Tn49+xPxF69h4PLeEaRG60TN6jwJ3YwvWfeluDpCBzgkVm/
 9M8tDnJvGr3rD0fsNx4+PfjHoUqJG9v9Eh/i27hxRsCJaXqihzSwQNG6WGQgg3yPHcejLtyAbT6
 LEAWftOaXvpezfwpM9W0+bdPJU0TU/6DSLvKCyjxaSE4KIqWZ1Ij2ECVblA6aDSRIOP84w4zEWB
 cXAvei+K8kFZSWtwyPFuAaNDETfEwqWFiKHXVN3HvCChSF0/8jC0xP6snmV+OuDCIqpNIYjnwJQ
 VknStrOuHA14wCKItpLEyK06jZijgwW4kXu9TjoxyZp0CUBpZx2p/JBLIqx7FOaU48U14asOje5
 5fChbN2on8cCnlJ0gqw==
X-Proofpoint-ORIG-GUID: y6pR_2oPtNfSSSZokyQaCDbmDj3gY1bR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMyBTYWx0ZWRfX3ZsfZFWe67Ob
 Y+WtwsLA+xZryhIWdD3HlQ0jZgljE5JPBg2dWzXs/P9ExrnonQMPZ33umtYev95zUy08GIn97+4
 KwlL6/YisGNs3mARnBTBSPPAdr40y2M=
X-Authority-Analysis: v=2.4 cv=ZYMt8MVA c=1 sm=1 tr=0 ts=6a6c3041 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=RcfcxWoR8-GxkwPa3McA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: y6pR_2oPtNfSSSZokyQaCDbmDj3gY1bR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310033



On 7/27/2026 8:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unprotected read of `tmd->cur_state` during QMI reconnect can cause the remote mitigation state to permanently desynchronize from the thermal core.
> - [Medium] Data race on `tmd->max_state` between the QMI worker and thermal core callbacks.

This looks false positive, as max state is not going to change with same 
firmware.

> --
> 
> --- Patch [2]: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 8a125ac63b99f7508e9f1e7c025b0c0da679cac6
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..555f2aff1ac0f
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
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
> 
> [Severity: High]
> Can the remote mitigation state permanently desynchronize from the thermal
> core here?
> 
> If a remote QMI subsystem restarts, it triggers qmi_tmd_svc_arrive() and
> qmi_tmd_register(). Concurrently, the thermal core might update the cooling
> state via qmi_tmd_set_cur_state().
> 
> In qmi_tmd_set_cur_state(), the request is sent first, and tmd->cur_state is
> updated afterwards without holding qmi_tmd_cli->mutex. This creates a window
> where the state has been updated on the remote device, but tmd->cur_state
> does not yet reflect the new state.
> 
> Could the following sequence occur?
> 
> CPU A (thermal core)
> qmi_tmd_set_cur_state()
>      qmi_tmd_send_state_request()
>          // acquires and releases mutex, sends new state
>      <preempted before updating tmd->cur_state>
> 
> CPU B (reconnect work)
> qmi_tmd_register()
>      reads tmd->cur_state (which is still the old state)
>      qmi_tmd_send_state_request()
>          // acquires mutex, sends old state
> 
> CPU A (resumes)
>      tmd->cur_state = state;
> 
> If this happens, the remote device would be left running with the old state,
> while the local thermal core tracks the new state. Should tmd->cur_state be
> read and updated under the protection of a lock?
> 
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
> 
> [Severity: Medium]
> Could this write to tmd->max_state cause a data race?
> 
> This assignment in qmi_tmd_register() is executed from a workqueue when
> the QMI service arrives, but it does not hold a lock. Concurrently, the
> thermal core can invoke qmi_tmd_get_max_state() or qmi_tmd_set_cur_state(),
> which both read tmd->max_state without holding shared locks.
> 
> While tearing might be unlikely on most architectures, could this
> unsynchronized read and write trigger KCSAN warnings or lead to undefined
> behavior?
> 
>> +
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->cdev)
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +
>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>> +						       label, tmd, &qmi_tmd_cooling_ops);
> 

