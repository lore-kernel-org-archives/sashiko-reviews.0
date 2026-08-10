Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A52385D75
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356316; cv=none; b=MrRZzRtKs+nIatsgI4m6yKgIyi/ASZKHHuDahE5NofY+5NPtBbsmyyKW5UT2vpdgQtp9DBWNJr2Z/22OWNeDHrZgOYPcYQZ4omUDt91GHqKpcL/BebkpDnBTElxlAvkZD09pUlqj7s6yyx85C6WlOIQUxxmO6VDG/q6S0gEf0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356316; c=relaxed/simple;
	bh=DFi+ri03epm28418q14ZXL2wY0hty5cLrFHsP7u0bIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVwa7mPEVvOpL1nncuOejX+mp31lCXs/X9D3q7+3BPh0Nfj+9HuChuyPsrxiWLNRfCCAnVnsu14hT6Aw5gw0/TJgHtXm6ZwjFzE6EUumEjVEfp9yOwNtM73wxQDdi7UIqTBx+4sHusKraNMsfPRmN/Ir/rw15NyKnBuQmNRZjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Wr8u0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jw8PDYUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Wr8u0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jw8PDYUW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S1tG1189348
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=; b=a3Wr8u0Tv76080z6
	hMN780aTImC+UEPQaH5EvG3gPBindWAAzBoZ1MFYpLjkyrnStQd8sM58vVeuzbX7
	JqqDeklT0y8rOO/oNGyrmf34tox++4EfH03YA+aps9JFLfWxzGObAlXPqR1SQ52Q
	Celqo7XVKnTrT2Mwa3ML2cEtV0xQkGg3N4+VFieXrDcNQGuRmdo9hegNgvD0FHfy
	a9BbWCoOw+YVto8HcIeIlv03+6D4KPfRC8aJY7daUj1vaaf7z1LRUPotZpgjcLoN
	pAS62VggxQwC3fLOjEUd73Xxsofo4IIcNvUljf3SH6FQZ2BE1ZmmYC+WlQDC5L/5
	Wbha8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v290fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:05:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2265264a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786356312; x=1786961112; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=;
        b=jw8PDYUWfgPbym4m0cb8zE/W4zLJ1S3dfr+PJofHNvaH/Ecp6tBFKIE08jpmn88Bmz
         61lRC7zIWvT+QBfOzbHJTjCYcSv0/Cgm+DyLMK91VH9A/MG2gFEvb7GWtPXDk0dEjgvZ
         cBPtbbagyM+YKnlOcf1zBpV5FMVWHjJIkMm1IiXlkpamsdiNn9JM3o8QkUrRfplMjjQQ
         /dweqYgcvrU2BTUw9ChcZbNsbALBh+OCkJjX+0ZQJTpiz8luWGZtOVOxrJeJkMgvHEBh
         6y1jKpavMvWVBSLYijPpcUneZ1sDmdfLMIWfY1W9EfaL8VXsHNdZKFhpfKFfQ8iGolYn
         7/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356312; x=1786961112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCZMdFIQ12HpapkjMtnExMI2PMsrZiy9TDsA7rzxbU=;
        b=HlypwvISTK2WKmb/ESIi9ZAK0LjSXxQkKPROnbi7fk5CUw5O8sJzYXmhRBS0X4vIn2
         oUk7FjA2clNMenOHc7u6sfst0efSyDn+9lVe2qAsfvyztShUsRYx08WAY2JrOlWm4Hxh
         Bnj1yyi63QJxvrbYwDn3KQB0u4YCUDx7V9g/pXrIZ+VxQbS0LhLhNlyvT3jnoC4reUN6
         tEsEMEyrSwnoGEGb25CHVeQCbAUDE/8LhOhF96RhHD+h4cW36woK9TALsleJklgFM5ah
         rw0loq70W+WNe5FRrDPCmlk/YHVOdUbC3biTiLwmjS7lWbqwHsIcFX8qL4ysYDPUK1aL
         i5UQ==
X-Gm-Message-State: AOJu0YwLRf4PaeFd+jKRohxnVgpP53An2mGRz9bG03S+C9+VA6cGJHMz
	UI5SH70oJA2sDSW5CXQEey9aoLTUbkCDOK+6DCrDSbCC0XBIgxa4qSkfBk5uHoacYpsQ5IujArA
	bHrC9JiolEm83cRRZ7XaL2d5o8NRl8Iaa+NIKhLuthi2LLSqyBPL49ynER7rfAeEuQt3ZSjk9xu
	tS344=
X-Gm-Gg: AR+sD10fCI3wDkB3ZBDk/20LB3kNtdAeEsfvM72e9vhsgVJhbcn6wmty1RMGthtyu+p
	TFKHs+uUsTVwxVX0+qx54OI7vaY9u8u4zWnYN4Or4HC1t4NC5Eh1ceo21pPRKE0YOfLU7IIUBSp
	kQLhHO8MHc/BVQVNtenTt1CLivy9YsjVegnUlC0c7K8sQM/h6q/1GXzRjbFUtV+N76dAa/ShDUE
	zSLjjzo3CwzAyX8NrQESYU9qIEjdbiVDSrpd/QQZqOgz1IX95BmmjG+s6sfDnroSD8bUgeJPtYV
	5onjx0P+W2Zd3hKDJ3XaLSkKkGDvfWry7/pGKP60SjSN7S9iaOFReWBlT1NsaLKt0zUbteIy/jm
	36AOPD4b6PXTkNAgXu+bwKIpW2i3Q7Io=
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr108451a91.10.1786356312413;
        Mon, 10 Aug 2026 03:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-392cc9f4517mr108368a91.10.1786356311946;
        Mon, 10 Aug 2026 03:05:11 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff23539sm12109902a91.11.2026.08.10.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:05:11 -0700 (PDT)
Message-ID: <30afe633-5693-4b2a-98a2-8cdf9b4d4e25@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 15:35:08 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
 <20260809124717.E97E61F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260809124717.E97E61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79a259 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=vZhdG7kDKKyHMTukbYwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ev-af1hV3a02xtIQ_ypox8G5FyKq0FOI
X-Proofpoint-GUID: Ev-af1hV3a02xtIQ_ypox8G5FyKq0FOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4NyBTYWx0ZWRfX2AAb6wMGEl4U
 lgUmXIXTwRU0V0fAKVaywKoSyp2D7ovkNpWZHOqNdwsa8QpE/dM5XYr4QHBA8MIF6zzJE8VmDRu
 0d1942BSmbJLnhEgaLNxlKhGPpkRCa2dwQDqpoYIQV4K9h7+7fX+xmOeCREF+K94lXjfhhb6qaf
 hVue0igSZ7YdcmrUkzPFtkpACs1eWG/qzIzVaYwJeOe0Uuq3sPU6LGcBQ/aE07GXaIxcT5ULq/v
 pjXxm+zUQhHU7J9qlZscbLskqY/XHrqhBANOSSyb4e0axkt8uXPCXcCyEdPEoj0cffwQNwduNYo
 5UDE+foxVP6PypYSfgJlgBgC6ZezLk8oBR9PeVRqKCMmiVAKyhrP/a+LaZIIXywndJqjPG6mNTK
 BG57NbhzvUeKI4blrLKjAK4WSeMe8jRgAf7ASEbsDl+e38+POccRg9ds5ml8NIpwl3NI3BACg8P
 CRB+GH0NG4frW2wD/nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4NyBTYWx0ZWRfX2wnpgffkq56x
 fsHIpKAjAPXU2nfN61zRqxnmaRrjLu6QWu6wNRzPNiKFLX4gaCN/aVUJXKF2xUIuDPIjaVL+Ziu
 UwdTWSmU6SIWc/6UpqQDT9L+fGkPbpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100087



On 8/9/2026 6:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:

older connections issue is not flagged now. All other looks false 
positive, updated inline.

> - [Medium] Subsystem guideline violation: Mixing `goto`-based error handling with scope-based `__free()` and `scoped_guard()` declarations.

False positive. This is a Style nit, not a bug. Mixing these patterns is 
common. Scoped_guard block correctly unwinds the mutex via the 
for-loop-based macro expansion before jumping — no lock leak.

> - [Medium] Data races on `tmd->max_state` and `tmd->cur_state` violating documented thermal lock semantics during QMI server restarts.

False positive. max_state reflects a fixed firmware characteristic and 
never changes value across svc_arrive reconnects. cur_state is already 
serialized — writes go through qmi_tmd_cli->mutex and reads/writes from 
the thermal framework side go through cdev->lock — so there is no 
unprotected concurrent access.


> - [Medium] Out-of-bounds read in `qmi_tmd_register` due to unverified string null-termination from the remote QMI subsystem.

False positive. qmi_decode_string_elem() in qmi_encdec.c always writes 
buf_dst[string_len] = '\0' after decode, so string is always 
null-terminated.

> --
> 
> --- Patch [2]: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 3146a8e00a4c8c2a3c39c7e5a390154a8fbfd945
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
> [ ... ]
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
> 
> [Severity: Medium]
> If the remote processor sends a mitigation_dev_id that exactly fills the
> 33-byte array without a null terminator, will this dev_dbg() statement read
> past the end of the buffer when printing the string?
> 
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
>> +	if (tmd->cdev) {
>> +		guard(mutex)(&qmi_tmd_cli->mutex);
>> +
>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>> +	}
> 
> [Severity: Medium]
> Can this result in a data race on tmd->max_state and tmd->cur_state?
> 
> The code in qmi_tmd_get_cur_state() documents that cur_state is protected
> by the thermal core's cdev->lock. However, max_state is updated here without
> holding any lock, and the call to qmi_tmd_send_state_request() updates
> cur_state while holding only qmi_tmd_cli->mutex.
> 
> Will concurrent readers executing thermal framework callbacks see torn or
> stale values?
> 
> [ ... ]
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *qmi_tmd_cli =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_dev_list_req req = { 0 };
>> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
>> +	int ret, i;
>> +	struct qmi_txn txn;
>> +
>> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
>> +	if (!resp) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
>> +		if (qmi_tmd_cli->exiting)
>> +			return;
>> +
>> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
>> +				   tmd_get_dev_list_resp_ei, resp);
>> +		if (ret < 0)
>> +			goto out;
> 
> [Severity: Medium]
> Is it safe to mix goto error handling with __free() and scoped_guard() in
> this function?
> 
> The cleanup subsystem guidelines document that functions should either use
> goto-based cleanups or scope-based cleanups, but never mix them.
> 
> Additionally, using a goto label to escape a scoped_guard() block violates
> the expected scope lifetime, and defining variables with split
> initialization like __free(kfree) = NULL before later assignment is strongly
> discouraged.
> 

