Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662035F5FB
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 23:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780444179; cv=none; b=qkMi9BmEUPlAgrQUYg9wQcvuSkEtbTwHs0C7/i4QBD8smXzUY48N4H420QXpLH3QKXH4yobPiHZED018nOo1XVWZt2UBcxCG6q2Y2KzIFDNbDGG2NSuGYCHOB8RQP9kadEXdPUoPjN3OKfAw7Pm5PjNcSI403+0vVEOBK7j9L8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780444179; c=relaxed/simple;
	bh=PP4Ab7q7bBhZBforAUmhfQA46fPz+szxQvwSCoQNmMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R648DAilaQilfTA/aTNUO71OYdqgOevnONSfz6VaTJJVQ3badFQD3ripCy3MLVVBCvmLF/up6h5Wd8I7eJHSXJW9Ad79Y8asgDEazwmvYYiQnF+j1aCEAA6yaOUo8dA7j6qPT6qMNZhpRHurS4ZRJYeJAOeJbYEsEcYg/7Uqduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poLfBzV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iho6Cb1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poLfBzV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iho6Cb1+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652ExfUG3430929
	for <sashiko-reviews@lists.linux.dev>; Tue, 2 Jun 2026 23:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=; b=poLfBzV04IZsVhrS
	XamRq4LLahGtNtLNrLxWrtzRuKPZ4wfGUlX/rVsO4OS4EuJcpMl3g4D9RiVGOfiB
	AlgfRN8E1o5AbtV6DEj1Ij0CrB7y/H8qm4NY5DkbrMPv75Za3TBHai9Sk4bOY/ug
	cx7uhFOZXXEy/bVyIl1gwQCcTgCoSDsfIv4/S3jno/UEgbqxZHyfs97AkVC1+sW+
	5jg8135YlYGFvRYHsfhDBq9xdPpw1eOZffcSxEoWXJLyINmjl9Gu0UKYvJd2L6BZ
	Y7KYPpr54Np5IbVUredYU75TLr9DdWVkkbUREId8uNkc6oIGl+kB/iqAycQp+IAq
	LcFDRQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mn7b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 23:49:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304ea1eea05so14606585eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 16:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780444177; x=1781048977; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=iho6Cb1+XSBmZkXAS0jf8k8OpVZzmr17yozLB8BVyAvn1BniBT0mGgO0GnNwAnWCcF
         WgNhMUiIYCxExP4+bNFaJUeQTZ7Z7CHlAtG/jyEHmYEdJBRi0Luzz2xfz9oE/1PrJDnW
         2smSIl/SVDmSEy3qMErUQRj9gPS2VvC7lmYI8YPObAgOzJk3sOUFQIPoJIMlqZEukC3n
         7O1codx9aGDYQLBgfHealy5ZGeqkW7eaXPwGencG5Lp37dTFwc8O2mp6iN5SNooyrCac
         Mi/kEUDjP1MHyONMBo+CkQsnxye2lSmel2dadSTXSvrmN0+EuEdtkifHqAlR9ciKmlSH
         B67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780444177; x=1781048977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cd9Ab75Rf14GfPrJvi6fhohIldOnPDctgt3FNkxUhC8=;
        b=JIoMGVvb+HmnpSj7SznSz4cLzACU6aw68ULL1UUr5BHj2XThRbsoR8yBsdWuEWJ+Me
         tn1r1ylMRJ1tHt1in4oJleWYagQGIXdVOfq/c7AMJIcNCMNKRfRckntid630Vfkvd4bd
         MNvvr+TjXEyUVFfVVXVMOOBLvmcmwSlo5eIN9mQHOBR99SrBBRTNiBgHMQAm9a7fIDlj
         Mkgdj3VhH9t8ggT3OcdslEDTTMnukW1QrOWB+5IVjMtOkhElU6s0EDAT7wFg8VzsWJ0d
         sPgGO8GZQ4hc0uouEQ7YnxQasJamuoHipX5kwx34MtcUbKIX5Rr5lBXzgUyHVaA5l59J
         ReOw==
X-Gm-Message-State: AOJu0Yx/dSxsAJoZyjCxKB+93a423HqRRl6+KFnNpAcFwLl0CpQV5LRd
	F+4ssX7fOEzRX9QX3skwE3brq0yFBA8aLxlgfqe46XH8oEbUsJ3YFvKbwTCNxSJ4BPEk8GEhRuQ
	lZtEWEPi7BLJ0HR5waZ24c9g9HQzFQjbG1kLIGrZ4SzmQrlG6YQe3cDTB7SvYuVPZle50cfhO4T
	rgQmY=
X-Gm-Gg: Acq92OGSY88/Bj6ty/prVT3LH1Mk+r9ITyi+RzzMDwXlL5Q6whQUk32aaaa9yGXeWH4
	E1+Jj9pkRTLm9wFyhiOe11WKo6++vvCTsf2i6yHeKx9Z0JsyEuAiGsGzBXLDeHlDHb54rjc4o7l
	Yfmhl886Y9bf0Ipduh89B3F6moLdtXO5Sdo98FatjmRy7OU3dK3HVLI6lM0L/mtF1e2CnPpGMJT
	FsIFqJxHYFvArDrAnU+4DdcNs1ISa7m2tgfZmJ5/XlSggaEvHJj2cHs9wVO0O6U+bV0gh8xVZBm
	LtQyETUM5nHauo+DQuCDEQj1O34zz6MLu3ev1wg26EYeqGZu62lqRgUtzWyfF/TmX5Ol3CX5D/Z
	iH/0VFQs3HwcHUG4v0L/kJnKCyKdXkqpPBRM0Hgw0emjHv1vZ0ZqQxrd6tpN3+v1+cLfXo3FaO2
	LMVzcBpEXiZAE=
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580434eec.34.1780444176613;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7483:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-3074fcaa2bcmr580416eec.34.1780444176064;
        Tue, 02 Jun 2026 16:49:36 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm1153763eec.13.2026.06.02.16.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 16:49:35 -0700 (PDT)
Message-ID: <cabea216-23ad-48dd-aa75-47c9708afdbf@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:49:34 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/5] media: qcom: camss: vfe: Add support for VFE gen4
To: sashiko-reviews@lists.linux.dev,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
References: <20260601-kaanapali-camss-v14-5-e76f26aa6691@oss.qualcomm.com>
 <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20260601164403.8CE831F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIzMiBTYWx0ZWRfXxSw+q0f9YeWc
 irjCR/1mkkuKf9b8v1qJDG+2VGwzcd5vVEMnM8x+Qoxrd0Soo1jA4ApKMaQcSeRBherI9XFA3lJ
 ovhWfAHG3EexaH/qA38qCyahqMkDnRvGb9X4+COKvM0Ip8y9ljJEkM/cpSWo+nOsQrY6JOKhpSA
 eTlYXAWW4Toyi3FE3afzU7k9pBaiqurzvkzZVe4USt5hH5ol1lmgiJlThNkclCMo8SmuCgT+vA8
 zF5vvWIDjm95wTosvAbtTzHTnqr7wXsvP0gdPW8sWq9Gj75ugAXjTPlzcZqpKTbGkgV7CBKSAP/
 0KZIORx17kg7DoXaFMSpm/Y9jTml6tqKWMYaDHTe16G/d8KDDaafo4dQWXT3clQPCkXApgJhgRK
 Rg3G5fSYzHabhwxqoUKmfUCpsatKV1cArmXKBGI6F15ce2GemEV+5pmAw0nqgTTRUDyf3AXJPJi
 kEVq+y0EmeHb6j3jmNg==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1f6c11 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NFO_ntjReJqzzR5GOAAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ikrZ6wc4KflnrbPt3tRNc_hJe-90sVK_
X-Proofpoint-GUID: ikrZ6wc4KflnrbPt3tRNc_hJe-90sVK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020232



On 6/1/2026 9:44 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Unconditional issue of `CAMSS_INIT_BUF_COUNT` AUP_UPDATEs in CSID stream configuration violates the Kaanapali hardware constraint, mismatching the actual number of enqueued VFE buffers.
> 
> Pre-existing issues:
> - [High] Cross-linked VFE and CSID pipelines will write `reg_update` commands to the wrong CSID instance.
> - [High] Concurrent read-modify-write of `csid->aup_update` and `csid->rup_update` across process and interrupt contexts without synchronization.
> --
> 
> commit 961118b5c346fbca24b27d8e33cf75e4120aa72e
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: vfe: Add support for VFE gen4
> 
> Add Video Front End (VFE) version gen4 as found on the Kaanapali SoC.
> The FULL front end modules in Kaanapali camera subsystem are called TFEs
> (Thin Front End), however, retaining the name VFE at places to maintain
> consistency and avoid unnecessary code changes.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
>> new file mode 100644
>> index 0000000000000..d73d70898710a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> [ ... ]
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but cross-linked VFE and CSID
> pipelines will write reg_update commands to the wrong CSID instance.
> 
> When this callback executes to commit buffer addresses during runtime, it
> passes vfe->id as the hw_id to camss_reg_update(). In camss_reg_update(), this
> hw_id is used to index into the CSID array:
> 
>      csid = &camss->csid[hw_id];
>      csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> 
> If the media graph cross-links a CSID source pad to a mismatched VFE sink pad
> (e.g., CSID 0 to VFE 1), the register update is erroneously dispatched to
> CSID 1. Could this starve the active CSID of necessary buffer updates and
> trigger an unclocked register access (and panic) if CSID 1 is powered off?
> 
> [Severity: High]
> This is a pre-existing issue, but there appears to be a data race when updating
> the CSID register bitmasks across process and interrupt contexts.
> 
> When userspace queues a buffer during an active stream, vfe_queue_buffer_v2()
> runs in process context and delegates to __csid_aup_update() via this
> reg_update callback. In __csid_aup_update(), a read-modify-write operation
> is performed:
> 
>      csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> 
> Concurrently, a hardware interrupt can fire on another CPU, executing
> csid_isr() in hardirq context. This delegates to __csid_aup_rup_clear() which
> modifies the exact same bitmask:
> 
>      csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> 
> Because neither context acquires a shared lock to protect csid->aup_update,
> can this data race silently corrupt the bitmask and cause hardware commands to
> be dropped or repeatedly dispatched?
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 319d191589884..826ab85a44a14 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> [ ... ]
>> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>   		output->gen2.active_num++;
>>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>   				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>> +
>> +		if (!vfe->res->reg_update_after_csid_config)
>> +			ops->reg_update(vfe, line->id);
>>   	}
> 
> [Severity: High]
> The commit message documents a Kaanapali hardware constraint: "the number of
> AUP_UPDATEs should match the number of buffers enqueued to the write master
> while it's being enabled."
> 
> Here in vfe_enable_output_v2(), active_num is accurately populated based on
> available buffers, but since reg_update_after_csid_config is true, the register
> update is deferred to the CSID.
> 
> However, csid_configure_stream() unconditionally loops CAMSS_INIT_BUF_COUNT
> times:
> 
> for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
>      __csid_aup_update(csid, i);
> 
> If userspace queues fewer than CAMSS_INIT_BUF_COUNT buffers (since
> min_queued_buffers defaults to 0), this unconditional loop will violate the
> hardware constraint. Does this mismatch instruct the hardware to ingest more
> frames than there are configured buffer addresses, potentially causing the
> hardware to process uninitialized memory or trigger IOMMU faults?
This seems to be the only issue that is specific to this series here. To 
answer this, we verified it and confirmed with the HW team as well that 
it is not possible for the hardware to use random address to write data 
to the memory just because an extra AUP is issued. It only takes effect 
after the ADDR update is issued.

Thanks,
Vijay.>

