Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E1481B1
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278615; cv=none; b=KOKSEviuaGvGo4XfJM47rY6uthR8Na2GfOVrEz5ZNj02K6eEpN+Ps7ksGIiThvCFrjMSXQ9k9iqYbLj8ft0Zctwhx7e0hJPIplVT98/fe6zriED4UQ7V1lh74aDGi0CY+XW0KJi8EQoV9SQTe4HLcLtAnSVlmwq4VTtXmvP6c/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278615; c=relaxed/simple;
	bh=fparAUPVgY15koQbrbOK3QvDtxDS/6ljbMVpkxL61aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWQ7OIxxSu1XLN2r63tx3mcuNDCef0j/HUvlILL0pyj9Iqzkv48n+ew2bkOUsI+df2lFbPUP8MNUdunge10nSCYhCpEAto2gO+hdVvWzKV6dTBQRLf2ood0IiPZJoQkuqE54xSAx83bLxMmHRTTSjw7HHCkgSET4Q/+es859Ioc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXwxC4BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+6qhsuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXwxC4BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+6qhsuw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1iIs2623611
	for <sashiko-reviews@lists.linux.dev>; Sun, 9 Aug 2026 12:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TmHvT4/YjSs5WfHLh5rtkoe8HudFYI8hschW+/Yne8=; b=FXwxC4BYLb7qIUnR
	wnSlNhFlxc2eVCTFwt8KCMGDApw2x97PAnH0poGn3uQbYH94ZX1r8ZR6K+NWSozO
	Fw5BDpknOkLc4X0pK8AWS1Do7zeCRF//b29BgiqvFmiacpYeB6LknyiF09YQcXyJ
	4SlP6akXT7iU6T9dHW/vR/zJXB0J7opeKl/ncJopf9BhcuyRoVm6dt2JAjzC7hYj
	ajPUV08dgxRoUdKifilHohgXdafZQ20NlMk+SEi4zMl6ID9zNK583cuGS1KxC+TP
	1jQxnorxeZ5VwKJwAg+NL/LFvNbr+RXb3ZIECh8nAQNktSOC1OtwzzUJr/fBGmUa
	Z9VmOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush2w89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 12:30:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2266757a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278611; x=1786883411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TmHvT4/YjSs5WfHLh5rtkoe8HudFYI8hschW+/Yne8=;
        b=Y+6qhsuwIRc0FIpEY2cPwBXONiLrMraYQRElOtW+Gv/d9i7cRl49f9ofbEdlIh7ZxA
         UIuY3itnEnROc6+0M8LHuvxb+7bi9PAWBYxQ0W+xwwZOHV4HSsBChy3n5gYIp+Y2Fdfq
         rqgqEk7HlnAiaZDCDRkGR12IPRb4NnxKFVt6mfhHZpqrBs9zIzZiwgqetsA97/fwzbVv
         9N9mhgwRDVLbvLI75foV4LPLZsfwLRbtIGbSpwuuj6XTR+7CuFCROOJ+EyPxIUmx0WlP
         9mJ+kGIL2WSkUlxkcvZDoW0f2Z1AWpNSnut0q2JGDHBFbKFpMh+BhK8m4QgMq+FEBJGN
         D19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278611; x=1786883411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TmHvT4/YjSs5WfHLh5rtkoe8HudFYI8hschW+/Yne8=;
        b=ivPbqCq9PK3jNF41KjCbT4+ScnSAlydhBYoDTPrNkwnN9JQd4tyiA8AyCldnh38Pj3
         Rcj6A8JSxkM4jzDzOawcjL2Rpbbd3ZRkohLs2Wa0poLf+SNpGkSPAzK2qxGpMI8I0JPi
         3Bl8pIku6cYCQnbXM6/a64zAhO5aZGXgMyFR34OLdtnTPG7iKHS+7RdkdQzcQ3haBbNO
         iH12HxDjD1NDodaTuZ3582gHUoQwBmxcTe98+sXnNim8VD8rCUH36yOUnFk0q0zblQrJ
         CzM0AbaF1cjnB9VJTv/NOrqGFoBX657P3aLU14QDqJXStcBumAYm6NKHejIpJl/hQiJS
         q/xQ==
X-Gm-Message-State: AOJu0Yw4iWd3jITpp5Z4ErP0FVsAf7iPx+cVFDRSutZn+s1Nr7+Soh81
	NTpx4mpuEG24PpKZWGqIyU8nCQlBIJo028iGxOU45yohNq+wKcS7OXg4/yPewgMmsgEQTHTqXK4
	fIGgeIZE+NTNiHSdIjA//ygP2AdbsikbCrE5VuIVq63OtamOyP6HG3iPNmwh8xKDTTIlK+rOCNz
	/s3Y0=
X-Gm-Gg: AR+sD13MFBrcT72u7US3BfWboJ92r1Uq9cOyhh1anRUl/mnZHVdDz6UViKrbKK8nl+4
	DW3AjQGHByFg1MDS/fK/ezZg2rKO4Q0fYq2rQSIi2rzcy5sWCDpHiSYkEd4WnSkgHMG/65KaLvI
	PsAzB2gJWxw0tVO5itxY7YBBcEt/eMaRGWmLSJOU1coKbUJiHuWZaUxCG4yFGIRTVHXuLIPu1oe
	FkzfoByqCYJerd0XhOhEmLZtry3FeoGwpR6R1yv7aeGZvz70LAqFl0cgpegrKoB9v7Z9Ef62Gul
	m8BKnVL3icDQDqhru2EVm9TKynQLsAThQZAvLK0azElJfszIRvOEFnoeVg7F1pn6tOjWW3mRWlS
	U7NPEk1i6q6JG2oJsR0UDoenNutQMIQKPnAM=
X-Received: by 2002:a05:6a21:d82:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cbc01f98bdmr19711510637.16.1786278610726;
        Sun, 09 Aug 2026 05:30:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:d82:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cbc01f98bdmr19711427637.16.1786278610085;
        Sun, 09 Aug 2026 05:30:10 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51846913eec.18.2026.08.09.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:30:09 -0700 (PDT)
Message-ID: <6701348b-e748-4730-97b4-5de68b73e806@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 18:00:06 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: qcom: qdsp6: Zero-initialize AudioReach
 module config
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-4-prasad.kumpatla@oss.qualcomm.com>
 <20260808184625.43C691F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808184625.43C691F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5AG3rpyh2xGNpBMzDCkgLpLcw4F9-BQX
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a7872d3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRJxzNKN9j24h2xmGekA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 5AG3rpyh2xGNpBMzDCkgLpLcw4F9-BQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfXxODFZs3dgITr
 yq6MgGKLotozg1VorDIrGT4gds07MHRWUhfAnhFvGDVAKL3ITHzSQTXALoNWQ5L8JVcGBkkGNif
 Qdix9VLAfzuoJfSrBZQKnox1SedyW8uI1eGugZuzrT2Fgf4DpJ8LW45cwIx3CnZ/KlPkdPsLxw5
 G+GcYVGs+j7NdL2tGrxZRQ823FGIsJrPzA+IXEuvszKHxiK1Psi/FSCxBDZVV0RDzPjWB4oaHDb
 OJcehYEIY4d6gSnm1jMDYWdQHBe0uNhDFoJf+YG2grVwyu1h57wEnFOMXKTg1r26+ZxqVPmgT4/
 J8sFhvasr+2xTMiQ86Q+BTkutS6BE7KdsoDC1Z2YskJHlElQdJNG2tdHzZFWKoZYiFluF99L0am
 NK0h7k25D7q9pmsMPOAqa9pAWIxBlBKMFvJUgEv0VxUDf2QVrhAT5VRr7xda9shRjg2Aw3P9FF+
 YhWpJLhx83bPofc0KAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX1SKnvRI8VQl6
 ichg5oWdbQadLykDNwYupbbbiz57Wwt5rFJQq9abXF19dGl0mFmTPtB9CE2QPZKyAYZif9NUfkU
 Vk9fNftOjSvD37fcazLo2KKp5LO9Li4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110


On 8/9/2026 12:16 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Memory leak of audio_buffer array when q6apm_dai_prepare fails.
> - [High] Concurrent Use-After-Free in gpr_do_rx_callback() due to lack of synchronization with port teardown.
> --
>
> --- Patch [3]: [PATCH v1 3/5] ASoC: qcom: qdsp6: Zero-initialize AudioReach module config ---
> commit f7d8f4b6351377745201f54e092ff89f2f6f845e
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
>      
> This commit updates q6apm_dai_prepare() and q6apm_dai_compr_set_params() to
> zero-initialize the AudioReach module config structure. This ensures that
> uninitialized stack data doesn't override topology defaults sent to the DSP.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index bf1f872a09f45..033197bdd8705 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -216,7 +216,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>>   {
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> -	struct audioreach_module_config cfg;
>> +	struct audioreach_module_config cfg = {};
> [Severity: High]
> This isn't a bug introduced by this patch, but while reviewing the changes
> in q6apm_dai_prepare(), I noticed a potential memory leak on the error path.
>
> If q6apm_alloc_fragments() succeeds, but a subsequent command like
> q6apm_graph_media_format_pcm() fails:
>
> sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_prepare() {
>      ...
>      ret = q6apm_alloc_fragments(...);
>      if (ret < 0) {
>          ...
>      }
>
>      ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
>      if (ret < 0) {
>          dev_err(dev, "%s: CMD Format block failed\n", __func__);
>          return ret;
>      }
>      ...
>      prtd->state = Q6APM_STREAM_RUNNING;
> }
>
> The function will return without setting prtd->state to Q6APM_STREAM_RUNNING.
> Later, when the stream is closed, q6apm_dai_close() skips freeing the
> fragments because prtd->state was never set:
>
> sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_close() {
>      ...
>      if (prtd->state) {
>          q6apm_graph_stop(prtd->graph);
>          q6apm_free_fragments(prtd->graph, substream->stream);
>      }
>
>      q6apm_graph_close(prtd->graph);
> }
>
> Does this leave the allocated audio buffer arrays permanently leaked?
>
> [Severity: High]
> This is another pre-existing issue I noticed related to closing the stream.
> Can an unprivileged local user trigger a use-after-free by repeatedly
> opening and closing a stream while the DSP generates events?

Hi Sashiko,

Thanks for Reviewing.

These issues are pre-existing and not introduced by this change,
which only fixes the initialization of audioreach_module_config.
I'd prefer to keep this patch focused and handle the error-path
and teardown concerns separately.

Thanks,
Prasad
>
> When userspace closes the stream, q6apm_graph_close() eventually invokes
> gpr_free_port(), which frees the port immediately:
>
> drivers/soc/qcom/apr.c:gpr_free_port() {
>      spin_lock_irqsave(&gpr->svcs_lock, flags);
>      idr_remove(&gpr->svcs_idr, port->id);
>      spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>
>      kfree(port);
> }
>
> However, gpr_do_rx_callback() processes DSP IPC messages in a workqueue,
> dropping the lock before dereferencing the callback:
>
> drivers/soc/qcom/apr.c:gpr_do_rx_callback() {
>      ...
>      spin_lock_irqsave(&gpr->svcs_lock, flags);
>      svc = idr_find(&gpr->svcs_idr, hdr->dest_port);
>      spin_unlock_irqrestore(&gpr->svcs_lock, flags);
>
>      if (!svc) { ... }
>
>      if (svc->callback)
>          svc->callback(&resp, svc->priv, 0);
> }
>
> If the workqueue is executing concurrently, could it dereference the
> already-freed port memory to invoke the callback since the workqueue
> isn't flushed prior to freeing the port?
>
>>   	struct device *dev = component->dev;
>>   	struct q6apm_dai_data *pdata;
>>   	int ret;
> [ ... ]
>
