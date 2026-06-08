Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF1F35E1C5
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897274; cv=none; b=hBgr+IOfAWm3B1zgHHwg53Nzf4SHluqe+Tc2KnLOuE8yFX3iNnCqcfIfYzB7WgznaHB7vn0mCUZ4vnMlzBblIIr6o5RLAOSf/P0iOxCll8C/10HFdRtE4dc2pJcfFmPAt5URw+b5T9Y3RAqZzcCv0LLG3SJafZbTr26yuRu4wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897274; c=relaxed/simple;
	bh=FJZJQj2R0WY4ADQJTBzk96MDj+UUFqh5UCbQFgrXHOM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Px3tfO1OiA0I3BMdgg7Lw5WpDa1mTte7RJNGXQsfUUbzEEKWgIUGQO0xHg3nO7hxPzIt393j9VRC6j1RSZcj2JlLpiq2HiSMvzdYyJu8pQdzsDIND+KH5Eld5x9qysxAQ5GYnO7AyuEaecVLiXVBzeJ2XVbNYNL44Ba3H/yfIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYgtH6H5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkbxD0By; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYgtH6H5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkbxD0By"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580HPKp1993448
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=; b=TYgtH6H5gIPyGS4c
	rT7mKiV0p6JI9OzJc8XvjpsvsTHKrQiqWdiTmqqygYfUJfJ2oJIq56SREB4BfX78
	vObtqXvSDbkx965dckH3qLF4u9mFnhCp4OLVNaM+P6gKLBeDnw7QLfetVJ5j/h6L
	ct/zM0kGTlXwxPumXiZSdg9kWLZgMZ87ckR5/bLMj7togwVQlHxSsCCb2Iqc05fr
	MmQ/dQG5li4LXwUMOjvlAChNqTG7yRn7e/apt8FPn/WRizspf/JQBmOUHfVNzydn
	l/nVobsFc+OHujhRtWEGKxN9i/4cREMambXEOYwdSP5jxXDNAgH1XOsUR3/eQTp5
	ZPQrAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3pdg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:41:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so73207115ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897271; x=1781502071; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=OkbxD0ByHfkyJYzUyZOe960EYtN+LIQgzPJ5QXfSRokbWGLQstFZWDeKgWcWSmqG6u
         HWPFWEgsikXTr/8pr0Psn7Gr9BLqVnd4xiPE9JYOykE5peFvrf+JidCy6OIwBsthot9h
         TpzWcm2rSelx1XgiF9FxX/JRMm1qjP44SzdmnRydsLNE6KerB/goKQ4wOs17npP/CsrI
         txwFeTbuADBLd9KxPYoGp47mHV+wATdlJ3qCuIotyFHjft9WkL8I4vGXjEngdke6Vpd5
         qCbSBhO/N0xbKQ4pS1Hr/b2kctN/58itItk3/s2Hr8DO4ftlgPZaXiNxEuGkDb9HmXei
         qAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897271; x=1781502071;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8AqFka/ah6llbSOKh5lQK3FxpLYZzfgVcN9OPM22xg=;
        b=TGGv3axJiV96YUMpwxtIhMJnM0sZglk7w9TxAYDOMAH9C7J/MKjqU5xqaowCaNzKXG
         GGBXSjO/jHglqRqnAbRuAJedwuHODDxZdY0X46NCVNQt1LNlKiZ8jm8Rv3RbczrGneNK
         Oxtedx8dGLIx5FW3l7bjAGSVoLkPELyCFuZnKwhMrUNQh+VEdXMEWqBE2DbpNb605YI2
         SvKDv7JAGZdP/o4M9fuZT3QGv8sKmv9Vnb4fvL5ijXnDUBnQj6rVMsoE8/oLj2lvOBaE
         aDZmZunxOPO6E67acbDrCFJmYKgEx1dH+L9GKHBENJe6VUAl4A1mqBfeB4EjuTpCvwm8
         kOjQ==
X-Gm-Message-State: AOJu0YyvlUCIm+VAW+I3ac1Y6pe31QRbnTgMH2nyB+rhDlCHQQVSqUjx
	OJ06VAPcDB017aoKOfY/gjDNqiLMQY4E/SG6K54Y/tDtL9unrt2jB8IOVOnWRu5aoD7fRSfAEMP
	GtMChS7w+364iWmYVnOETE29sJnyL11JxoTlvwzIzuo5hlDuRJIPoRek+eIc18dymmoytgW6xv+
	Kp9Gk=
X-Gm-Gg: Acq92OFXMAx7nUGdwGz39H+aKAxhJ9uTIPv/CGtI7LwGaNobqzTxy8/LM3E2URXAFyl
	D8+7+IYZBc442zyksDenRKUdmfwmhk70mdq3ZSB29kGpiicWwKpYHqQ6Ji0RMtA+7yCurjdGlxz
	sCwo99PpjUlqDxWKiWRi0jM32HJWoXBJLkdzjiVbTx6AJqGAqVJdmn7xWp8XBsjLsDbaM7cIYZ4
	B4fWaWEX19e+fp0BWYBtQv8fo6IhP63CpyXT4Rh3T42lMdQTrWnEpWvjGncpdN3ze00f1CTuQ/B
	DTrnyam/vx0SyVjU7LunLf+Hs8Ns8VlyMjQijiiQudkbAsTMIkkMGrmbRz50PJZLNSzUnGvaVFX
	otVJVsA4N++q437aAORMT2KCF74VJn5fuRBcPOF+coHbXLGTjnn6UkR4AoI3T98tU
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997435ad.1.1780897270681;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr173997065ad.1.1780897270201;
        Sun, 07 Jun 2026 22:41:10 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c249aeb62csm42888625ad.68.2026.06.07.22.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:41:09 -0700 (PDT)
Message-ID: <820d88f6-23a1-6371-b0ac-90b13c493ab3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:11:06 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 10/12] media: iris: Add platform data for glymur
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-10-afaa55d11fe0@oss.qualcomm.com>
 <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603144621.5230C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX5fZEWeNlW+Iv
 nzcVyKCvLfOs0Q2itkuHVIM3+mYPMJDdfIPyoeMLw9Z5bg+VQHFXovT5e8fco1kgdWc+uE+2RXB
 /A5FhYCe1pZN8Vu+fOD50FbMr8qxmm7c4Rv223tM+A6CIiCSCK5EIV4l7G4+rEIRfKoigHG+w3D
 952eMNbyb3EZJ15PwVLJcj/HU4ABVhhNx+otB6yBjZSX1WoiyQYEd8D1CzZowqzndRG7sJ+VL2v
 f9gZ6JBGKpy6zGkQGsndK5YbYLzdpPfn92NlvbeyiqQRs3N/SXyjCVnuS2OjdyUTJO3WuM+0kDj
 j76jT5qYYYWq9w5pd1uY5c06dzjF8hN5Hd1wFBlLK34WtbqoK9tjKX49pYgLsYhBDO6rsxpVZCh
 0AjQ8wkiaR86oJRmHbiKKX/K5zPfw/wvrziiUWCneuEtx+qOiqb8bFCdRnI3odP1Zpq3gbMKa6W
 T0VBmlflNhBXyA1zBXA==
X-Proofpoint-ORIG-GUID: E-s_JRaHoHN3Sq9iFPm6V4ljOBIJsDAF
X-Proofpoint-GUID: E-s_JRaHoHN3Sq9iFPm6V4ljOBIJsDAF
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a2655f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UNkTylL0TICJFbUdM8kA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/3/2026 8:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] `iris_glymur_deinit_cb_devs()` unregisters and frees `core->fw_dev` but fails to set the pointer to `NULL`, leaving a dangling pointer in the `core` structure.
> - [High] The address of a local stack variable (`fw_fid`) is stored in a permanent device structure field (`dev->platform_data`), leading to a dangling pointer and Use-After-Free once the initialization function returns.
> - [High] Silent cancellation of IOMMU deferred probe leading to improper fallback.
> --
>
> commit 22223f505726fa5c0ee432b64a8712aa1e89468b
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> media: iris: Add platform data for glymur
>
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> new file mode 100644
>> index 0000000000000..c42ac99870ede
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> @@ -0,0 +1,106 @@
> [ ... ]
>
>> +int iris_glymur_init_cb_devs(struct iris_core *core)
>> +{
>> +	u64 dma_mask = core->iris_platform_data->dma_mask;
>> +	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
>> +	struct device *dev;
>> +
>> +	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
> [Severity: High]
> Is it safe to pass the address of a local stack variable to device creation?
>
> Looking at iris_vpu_bus_create_device(), it assigns the passed pointer
> directly to dev->platform_data:
>
> iris_vpu_bus_create_device()
>     ...
>     dev->platform_data = (void *)iommu_fid;
>
> Since fw_fid is allocated on the stack in iris_glymur_init_cb_devs(),
> accessing dev->platform_data after this function returns might lead to a
> use-after-free.

These are sync calls, It won' t create dangling pointer de-reference.
Making it to global variable is not required because of one time usage.

>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	if (device_iommu_mapped(dev))
>> +		core->fw_dev = dev;
>> +	else
>> +		device_unregister(dev);
>> +
>> +	return 0;
> [Severity: High]
> Is it intentional to return success (0) here when the IOMMU mapping fails?

Yes, intentional. When Linux runs as KVM managed, the firmware device has a
stream ID mapped via the iommu-map property and the IOMMU mapping is handled
here. When a hypervisor (Gunyah/QHEE) is present, the iommu-map property is
absent and the IOMMU mapping is delegated to the hypervisor. So returning 0
in that case is also a success path, not an error.

> If device_iommu_mapped(dev) is false, the device is unregistered but the
> function still returns 0. Without an error being propagated, the firmware
> loading logic might incorrectly fall back to using core->dev instead of the
> required secure firmware domain. Could this lead to TrustZone load failures or
> IOMMU translation faults?
>
>> +}
>> +
>> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->fw_dev)
>> +		device_unregister(core->fw_dev);
> [Severity: Critical]
> Could this unregistration leave a dangling pointer in core->fw_dev?
>
> Since core->fw_dev is not set to NULL after calling device_unregister(),
> subsequent initialization attempts might dereference the stale pointer. For
> example, if a later call to iris_glymur_init_cb_devs() fails to map the IOMMU
> and returns 0, core->fw_dev would remain unchanged. The core might then
> proceed to iris_fw_load() and pass the stale pointer to
> devm_qcom_scm_pas_context_alloc(), causing a use-after-free.

If context bank device creation fails, It will end up into error path and
won't reach the iris_fw_load(). And I don't think so that first time iommu
SID is mapped success and next time on-wards iommu SID failure case.

>> +}
