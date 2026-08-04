Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF764AA4
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853185; cv=none; b=In0CdUdBh9tK/Tmn7LhdzxFlpmv17FpX2ftbzAI/YukDRP1mmHm6Kt/HiEwEA/bW97mrBZydFklZJaOJ5gJ6aRaEzoLrH23a8SglKuA+6nFeOQj3oGhPG57kWd/RXXLBpzJkJKfJQigWKnYIaC0vQ3jpIdQSub9Dce/Vi3jIORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853185; c=relaxed/simple;
	bh=O8BzbCBcjhGwVRbtwuRkH7SD+ZtA/43OKIVWt2hRWig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKUZGlcP8kMvu1FZypvw1rzWdrNH9Aw8NdF4EcqPsgC6imwVz557CcvpadE5Ele5zJwNSy+Ek59EVSJ+GMKRJwM35q7a60Xj0AZdUZ+aBmX26BiQ7Z0dzoabq20lorNl8q1nYNIhmmNF+yMss0jBmc99FwNYKXkLEUYlhsF+xeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RokXGYZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSDIqzSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RokXGYZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSDIqzSe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CX9uu4129532
	for <sashiko-reviews@lists.linux.dev>; Tue, 4 Aug 2026 14:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=; b=RokXGYZauFUft47+
	qld1gi20gh+J/zXd5XWmR507blMz3qOl4MjnwW39H4jMmNrRp15MFqZu1ML+aj2w
	TspvZmof8cnNMk2h4AjEGs9Ec4b4kONIJ0JDmEHhzfy6JgCpQ/3Im4htbGTtzH4q
	Vt9aGr7VuxpP+48N0NvAqRw/+l/fvH7NXylvCyqpKWHO9piz2wu5EuF8qEAEeXPa
	hi9TVduaW3vQqN2zqmH0BYijpldKPVwvf3uq72t8pnoZzR5CnEfXps452PleZKqJ
	Touv4wW3RsBdt7nDfmdm7ME+fTH3maaNKuuAAW2ikP6y76FMaw7KP4IVOCcqbiPK
	4/1Qsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug658fgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 14:19:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso3162974a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785853159; x=1786457959; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=;
        b=cSDIqzSe0GILSwpVWg+J9K5Cz2kQBcIqrbebr1TCSBpgN+ee4qwIT95IwxE/yqj0+5
         z86XtUZI9dsV27zJGLIReKvQPyt3CVvdx3u/T4T123GzrlDJF9+LiVCCoVUB4dpgmYNk
         0tScCsIKoJ5w/mACaDxepMf4JIM7b/PWXc7dGbRMlWJfXe6FrDNG+LsvRzmN3b4eSnmw
         fuYwSnCKIwK6iNYeZrcKe9UFLeHGmoMC/klFhWMuVA8lh/JGJQh+XrlINrV5eNoSg0x9
         Ar56pH1EW6CIR3Zx8Y1M0f/u2MpbQgzvYwPZ3mSIvHRLz5e2ZnyBgyJsPW0mL9Fc5Ww4
         Jy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853159; x=1786457959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=;
        b=RjVLjFGRbhNTIdr5TG/3EeWq3vaL7oM7/2MxqeZsTPxcgmm5Spp2aBjVzifBrWE0GP
         zESpBdBJl86B/NdaIpYrJIIgAhm4NX1Dan9ct9j7+5QZCbqrNWG90a+LQP6Iw/ihQbiU
         Pao8H/fmp+Tfvbp4vLTBGd1wmbxSXcMVM6Pb2+Xlf5jKbsKin1LGNiaEBjhn18b/SK0K
         qqrZVM4UMzReAnSKDf7bjANhj7axq5meNcM8IG23BA2e0gQzGb7foQQEJZPnYITrzkh9
         ZaqFbYQElH+IVeKgBYrpx3IMK8W8o2Y4eS2/gWrYp1NYPKR6Ip3+bsVuBBjSE8DqI4WE
         S/zw==
X-Gm-Message-State: AOJu0YxKsIGq5h2s0IwDzP9hNyYR7qIwuxuMd1vl88rL6mhm29aX/l8c
	o1T4aiAUB28EvFlpqpMZfKuQizX1uNXU1mc1GkGiuMMMkSIgmEIUkv+ebkNiO8Ltedk25iBe5HA
	dg7pE/+CMEIn3BlMRqm1znFZlKB4+47nDh+bhW2JnrrJ/QSbXqb6FCRxp/+WmOtkSNaqq/CwrWV
	dfERM=
X-Gm-Gg: AR+sD11jikFivbYG2xJLTJVk/5ZWkqiyls9PRtgolpH4j9Uwkl3Qyw4n8yjAkgGTZWF
	uyqeSUoyXvzZbL8d8auADi/SGndlnWz8HBdpJtBWlEQTyAvAiarIWyJDsSJ4iHFyFVMVNbisfEd
	aEVxc3IfviTCB8pLbK5Kr3ejGM1sZNM3lCIHST+n9lvIGSfVp5GBbo08+T0yQMLRTpdrV/uygZk
	V7DXfecyJH5aVNEgCEZR4qnSAX+3Iy6MbK1B532yoUEnAe4NxQkqu5Pd+2Lw3R5D4eiJlaG6P3i
	b5O2qpJocZg0rIr4NRvkz1RKPQrP/wdx6eSEKklIP5v4G9NX2ULDVzZTzRlswYG+UjMbydiYele
	Swf7JJypLu2Qmc4QH8cjrdFUpWTMIIUlLVA==
X-Received: by 2002:a05:6a20:db92:b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3c92a839c3bmr14175341637.37.1785853158750;
        Tue, 04 Aug 2026 07:19:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:db92:b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3c92a839c3bmr14175300637.37.1785853158190;
        Tue, 04 Aug 2026 07:19:18 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm7297294eec.16.2026.08.04.07.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:19:17 -0700 (PDT)
Message-ID: <71b1436f-acb9-41a9-acee-96a1aa79170c@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 19:49:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 02/12] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-2-889281373870@oss.qualcomm.com>
 <20260803095903.CFAA21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803095903.CFAA21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kRxwnY_JymfCYHR993MTsmhsGy3Z4aG0
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a71f4e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=598FUc-ZneajLAHzYwMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExNSBTYWx0ZWRfX2Nu56opOmkav
 jofrNzxCL5RaFjziKzXOdnpRKo7FIVB3o1Qxlq5ewnjDiRqxQX3ljrlGRHGAv8B69gvAq0f38G+
 RVj5oD9hDbfumG4jbBoOPodS+pTCn7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExNSBTYWx0ZWRfX2XfWiQPx+wM5
 t9DaFP0PuYX7RHPe+MOL5tDunnHv4/LGyfDiV32MGtm+4R6qfWU0OiLZrb4QKAxSl1gVidJj2qE
 q0zeOtePrPibk346PQrFUsGTntLN6rNdppWEahBlWCeLmxp+zfgyCvHmSabJz6WBJCDs5UmKUX0
 aHLKBFN1+ZTz6QQGPyUxuqtOuAMe/wYVnhfSoeKE2FgznM02/wMIaLZB65OnLfNo5XY9eVX+Z67
 GWP15LadOUvYV2hObkayl4qBHPNE8eHtvK/LGOAyspK9jhTCerSNhXBbY3mFJNwZJL4E9Eo7tl6
 dF9sqTrMmMM4ExtoGIkF4zaCDqqdWrbxaOvMAuhPVO5nwqh1Gw1sTHEdaNB4rjVzblvBAP4iij+
 sVMuYJeXe5fNuNH2zd8wZt3LwX9ad+GpEfZbB2Li/9eZ+/BkoyWC+tp17WmYdlA7PoKQ1atb5DM
 SfsdtRtSti8pNFnoppA==
X-Proofpoint-GUID: kRxwnY_JymfCYHR993MTsmhsGy3Z4aG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040115



On 8/3/2026 3:29 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [Low] Duplicate predefined reboot modes are not properly deduplicated against DT-defined modes, violating precedence rules and causing duplicate sysfs entries.
> - [Low] The patch silently changes how device tree arrays are parsed, skipping valid properties with more than 3 elements.
> 
> Pre-existing issues:
> - [High] Memory leak of `struct device` in `reboot_mode_unregister_device` due to a missing `put_device()`.
> - [High] Multiple instances of the same reboot-mode driver cause sysfs name collisions and incorrect device unregistration, leading to a Use-After-Free.
> --

[snip..]

>> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	const struct reboot_mode_entry *modes = reboot->predefined_modes;
>> +	struct mode_info *info;
>> +	size_t i;
>> +
>> +	if (!modes)
>> +		return 0;
>> +
>> +	for (i = 0; i < reboot->predefined_mode_count; i++) {
>> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
>> +			return -EINVAL;
>> +
>> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
>> +			return -EINVAL;
>> +
>> +		info = reboot_mode_create_info(reboot->dev, modes[i].name,
>> +					       modes[i].magic, modes[i].count);
>> +		if (IS_ERR(info))
>> +			return PTR_ERR(info);
>> +
>> +		list_add_tail(&info->list, &reboot->head);
> 
> [Severity: Low]
> Does this code append predefined modes to the list unconditionally without
> checking if a mode with the same name was already populated from the DT?
> 
> If a predefined mode has the same name as a mode from the Device Tree, both
> entries will be added to the list. When reboot_mode_create_device() iterates
> the list, it will create duplicate sysfs entries. Should we check for existing
> modes and deduplicate them to honor the DT precedence rules mentioned in the
> commit message?

This is documented for pre-defined modes.

> 
>> +	}
>> +
>> +	return 0;
>> +}
> [ ... ]
>> @@ -183,52 +284,36 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   
>>   	INIT_LIST_HEAD(&reboot->head);
>>   
>> -	for_each_property_of_node(np, prop) {
>> -		memset(magic, 0, sizeof(magic));
> [ ... ]
>> +	if (np) {
>> +		for_each_property_of_node(np, prop) {
>> +			memset(magic, 0, sizeof(magic));
>> +			if (strncmp(prop->name, PREFIX, len))
>> +				continue;
>> +
>> +			count = device_property_count_u32(reboot->dev, prop->name);
>> +
>> +			if (count <= 0 || count > ARRAY_SIZE(magic) ||
>> +			    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
> 
> [Severity: Low]
> Does this condition strictly reject properties with more than 3 elements
> instead of reading up to the maximum supported count?
> 
> If a DT configuration defines a reboot mode property with more than 3 items,
> it appears this would skip the valid properties entirely. Previously, would
> device_property_read_u32_array() have successfully read the first element
> and functioned correctly while ignoring extra elements?

A driver using reboot-mode framework should handle this case imo.

thanks,
Shivendra
