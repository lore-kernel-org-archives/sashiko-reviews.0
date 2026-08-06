Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD543264D5
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 15:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031340; cv=none; b=BF89CoO9mcyoleumWPlMXTXx+doZoeAu82Hk0ZzrbRJ7Vev6FTouoey/vbIyfrnONzlFv08zDTMKIsLxsITx6hVLc30WtdEdOHIP/VN8iqCVjh7is5rIoOMfxAEZKKVpHdk8Z/POIO5P0dU+trgjlgeUTt6fIQVK/2coLFf9v0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031340; c=relaxed/simple;
	bh=v5TDmuQpqA82E3dy438qJQ0HCn9njcWZXH83JntM5Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWMbdSjyKNe51FxMpfpjqWuaYvQ7fRh1MfUr5vcuFrMFizqqEnf2FBcZxP9WmG5M2wB27BW3iBgFmzDB/CaWGE4maXLv6OzwwoSJRbX2NOuq4XtCCjH1aPJyDagSdKOz6szI170ZWUiYbjqeNBhD7+Our302BGIIojdJ7BqfG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9rP6uxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8GBkEmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9rP6uxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8GBkEmb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Ensei2570203
	for <sashiko-reviews@lists.linux.dev>; Thu, 6 Aug 2026 15:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=; b=Y9rP6uxZ6jARpBXU
	smu8lSXunEjdNphRzEeAMayE3zW53ucXz2fdkQtZP3wJSjiFsKBhukXdQbmnUtIh
	Q02vCqSwBmh+0uAk1jxauEa9h8fJeHojNQ8dm0RGAYwmOWRlbtCb4rcDFggYzy6H
	qswN8fjZ5eeAjDye88DJ+4kAdEfHJR1A3AMlKm67FgUMCxITGkNo+HcCzXtj1jC/
	TFFmMnWNzzf07ef5w6aeT27ww/lvJVkke8Wcjcl4uUqESCc1OxyJYHzsW3KhWT+4
	qpKFKWLDod/mpE6KejN5xy/1e2v0ERbkNE2B4eyRsin7aB1mZM+Trt7TWfwkiIw2
	v9Uh3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud33jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 15:48:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so391014385a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 08:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786031337; x=1786636137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=;
        b=e8GBkEmbJEgeInKc4yXMWR+fxN4ga1IVtzJiLZq3L4A7vV3w44Ri6I5s0zbsehmScZ
         ywL91mrQKi8pPRWG4VgQIzb5fUZrQzJpON9FdcNxq5nMKMMolZ2ZbE3NamSESjqDX5po
         Q86LeEwfCrAxFttRa1JozApV5VTZruW2kitrLQGn6pISrOTrQLEF7ntjNkpFpjWAscTp
         2jZq9XqVbaD2xJm6CzAwaneNyE5R6CgCPjuwFjAUqpn3hJdnayjVfbIr59a9df34QHPS
         kwQLUOKz6nnW0i1bC0wnmaaszLFuJZ5/wG9NK7Wx2uEsxa0cUfmjr0k6SWpCN8Dlcz/i
         3mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031337; x=1786636137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZXBp15b585BWkwKGjEqMmNg+nscR5MNbxgZpGEOoco=;
        b=axWtBsmMZxzhL8JfYBNiMFbxhN9Z8SduyO/c/6IkkXu+4e8iZMYAp+rJwRQYr/Ud5N
         GO6XHQuP+mW/0FBq6HaPlPIsPfwWQrdMzFNWXgaJPCmazNHWkKllEWjb3YawgZIeavDj
         G3tDa9tylQQCbuZ3qachHSlM8Vq8xo8uBfFbjdfYgnMQwgMh967MlE02XnI7az1ZI/+6
         wUG3uz6G9wmoUc6BXU3AS/ATZIVXQWbE920NRHZM4ynplN0DL5OlrNYPW661v2UoZz54
         KDnnxYNZOS2zCaF1aFA4oGwYf54CWFI6+s0a+zeLRyEHzQz4726AcFyDnsCbhmkAjJr1
         2LZw==
X-Forwarded-Encrypted: i=1; AHgh+RqykFKi/MGvax3eOmISBs98IO/8gcf1JuazejvMJ8bOU4r6Jf6iH5lD5qOGiXVPIrE8bwISZqJ8x9eRl7xwz3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo6r3UGj/yJI6dhjVzx08LQb75UIrbG0mmfVU6H7Vyq6HkijrQ
	fCxT1tvSRCoS2VrcPLzby4zLDgJXvpYtSijbSnFrevrckKIo9RD8v/vto5tsdF5Vu6SJolTJKSY
	8QR/ZgbJ75CstrezCHaEpCzwa5fggivn4MObA+gLfL9wq8LkgPdMNalttdZinEzkwYGbScSE=
X-Gm-Gg: AR+sD11XAZ8oOD8RkO01mrSBnHfw/1J+vQkoSKlsqnOqBD845HzWyOXsyRpK1koO9UW
	RZOIMWBt91b4IrjyciMz/QC5bzH2l9gAA4BvIgXESrVY16jLn9hf4btzahptD5Z9Gk8cURbAg3W
	86cPfD8s1a0ZH76qyKWz9unYd9mD/2B8lJ4gfsSoHufZEJHgIxKJv8rsgUhtT0M2lOdHE1JbcyV
	LiAXBErbuPYQathgUqL+wa2ZmjmDhTE2rWNzO+edylKHiIp1zIXpVMYkl0q1Lg74vLKrrRhamaU
	WDBQ4gpmOs++xLavGf7aAT8RmRwiCXO9Jn0mAR1qZ66kESbheQvbZIHLKYIN0PGhAZT2vvEs4+a
	TlpIH5lnYZgQWSwbo5fwTUMbYEP9bwhE=
X-Received: by 2002:a05:620a:a10f:b0:92e:bd39:9993 with SMTP id af79cd13be357-936491af165mr1370753785a.31.1786031337260;
        Thu, 06 Aug 2026 08:48:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a10f:b0:92e:bd39:9993 with SMTP id af79cd13be357-936491af165mr1370747385a.31.1786031336714;
        Thu, 06 Aug 2026 08:48:56 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936583cdd32sm274043585a.7.2026.08.06.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:48:56 -0700 (PDT)
Message-ID: <67fd2a5d-fef4-4292-b981-c930b55aafb4@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 21:18:51 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
 <20260731105316.BDBA51F000E9@smtp.kernel.org>
 <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX79b5UPK3miOz
 IfmGmdsijJxr1fsOdcJEuZOEeBGufJn52Z7sE8+DJWrq6FW3L3jmEwJG1HFgms7qAjZ03k+FitF
 hxt5cB74W+363XCapzO4HPHRE5L078lb2Fp3rLpUdAAqymERvhgnM9GY2ez4iNiZYkp6/xNWlb2
 lAoNKC38eI5H7brxJJmXLr/Utb5wMGZx4djB2OmYKu7W5lkQAP6LUqp/YjEsAWxNSDDsn0rlxYV
 OlNPbSrE5ULjE9utFi2izcI6E0BneKa9/b46c6nfYP/k9FPdvCdj0AuCdtgsNlmeggcOYzB9OHS
 uVMdwbXpJS0sm/fJyonVgUB5dfafsXbResdAALbJunphPQ9GDWqZEm7UgZY+lw82irpy2Dfteud
 SaMI2n+cOxv/9ndNqR49idfJhng8dWRbs7liNdQkG5l4Ts3wkbukrxJDXXMZLlAEQ8WvT70mZjr
 P71xK2WExBUbCFJhXyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyMiBTYWx0ZWRfX+tnPyI0rFYth
 RJZwOC5vORxpCTSvg4iENv8F1w5vd1D+lecPhIedAxOqQ4hdVdaeryySh4gkvefZ8WxnAD6A4M+
 lN0e4U3feTqX1WFEXCRycxQzqJeAWbA=
X-Proofpoint-GUID: wOcKnLjJo7RSZPGlN3gBaGLgNeEQ4L8D
X-Proofpoint-ORIG-GUID: wOcKnLjJo7RSZPGlN3gBaGLgNeEQ4L8D
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a74ace9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=PaKyr2AS0Ek1y2y1GKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060122



On 8/6/2026 3:10 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 10:53:16AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Returning success without saving the requested mitigation state when QMI is disconnected permanently loses thermal mitigation updates.
>> - [Medium] TOCTOU race condition when reading `tmd->cur_state` during service reconnection causes permanent thermal state desynchronization.
>> --
>>
>> --- Patch [2]: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
>> commit 02c2244c0a2cebd6be4e1bf4e41d51362be19b5f
>> Author: Casey Connolly <casey.connolly@linaro.org>
>>
>> soc: qcom: Add QMI TMD support for remote thermal mitigation
>>
>> This commit adds support for Qualcomm Messaging Interface (QMI) based
>> Thermal Mitigation Device (TMD) cooling devices provided by remote subsystems.
>> It allows client drivers to discover the service and forward cooling state
>> updates to remote processors.
>>
>> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
>> new file mode 100644
>> index 0000000000000..37e6ef19a0b34
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi_tmd.c
>> [ ... ]
>> @@ -236,25 +236,54 @@
>>> +/* Notify the remote subsystem of the requested cooling state */
>>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
>>> +{
>>> +	struct tmd_set_level_resp resp = { 0 };
>>> +	struct tmd_set_level_req req = { 0 };
>>> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
>>> +	struct qmi_txn txn;
>>> +	int ret = 0;
>>> +
>>> +	guard(mutex)(&qmi_tmd_cli->mutex);
>>> +
>>> +	if (!qmi_tmd_cli->connection_active)
>>> +		return 0;
>>
>> [Severity: High]
>> Will returning 0 here without saving the new state to tmd->cur_state cause
>> thermal mitigation updates to be permanently lost?
>>
>> If the thermal core requests a new state while the remote QMI service is
>> down, this returns success but drops the state update. When the service
>> reconnects, qmi_tmd_register() will re-send the old tmd->cur_state to the
>> hardware.
>>
>> Could this leave the hardware running unmitigated while the thermal framework
>> believes it is actively mitigating?
> 
> Please address at these comments.
> 

thanks, checking these comments. will update on this.

>>
>> [ ... ]
>> @@ -298,34 +327,33 @@
>>> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
>>> +			    const char *label, u8 max_state)
>>> +{
>>> +	struct device *dev = qmi_tmd_cli->dev;
>>> +	struct qmi_tmd *tmd;
>>> +	int index;
>>> +
>>> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
>>> +		tmd = &qmi_tmd_cli->tmds[index];
>>> +
>>> +		if (!strncasecmp(tmd->name, label,
>>> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
>>> +			goto found;
>>> +	}
>>> +
>>> +	dev_dbg(qmi_tmd_cli->dev,
>>> +		"TMD '%s' available in firmware but not specified in DT\n",
>>> +		label);
>>> +	return 0;
>>> +
>>> +found:
>>> +	tmd->max_state = max_state;
>>> +
>>> +	/*
>>> +	 * If the cooling device already exists then the QMI service went away and
>>> +	 * came back. So just make sure the current cooling device state is
>>> +	 * reflected on the remote side and then return.
>>> +	 */
>>> +	if (tmd->cdev)
>>> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
>>
>> [Severity: Medium]
>> Is there a race condition between reading tmd->cur_state here and concurrent
>> updates from the thermal core?
>>
>> When the QMI service reconnects, tmd->cur_state is read outside of the
>> qmi_tmd_cli->mutex. If a thermal trip point is crossed concurrently, could
>> the following sequence occur:
>>
>> CPU1: qmi_tmd_register()
>>    reads tmd->cur_state (e.g., state A) locklessly
>>    
>> CPU2: qmi_tmd_set_cur_state()
>>    acquires qmi_tmd_cli->mutex inside qmi_tmd_send_state_request()
>>    sends state B to hardware
>>    updates tmd->cur_state = B
>>    releases mutex
>>    
>> CPU1: qmi_tmd_send_state_request(tmd, state A)
>>    acquires qmi_tmd_cli->mutex
>>    sends stale state A to hardware
>>    reverts tmd->cur_state = A
>>
>> Will this overwrite the new state on the hardware and cause the thermal
>> framework's view of the mitigation state to become desynchronized?
>>
>>> +
>>> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
>>> +						       label, tmd, &qmi_tmd_cooling_ops);
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com?part=2
> 

