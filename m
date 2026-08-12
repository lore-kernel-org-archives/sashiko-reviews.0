Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E31336EC5
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525703; cv=none; b=ZcSd9v+Rj4lOk2wDRfuBLWE0NKQnsXOKdQaRXsOjCHgLudw5Ybi6lXtKUYPnNkLi6xrRQBtwE3MhmWIAV0jlAGnsGGhT865wtjEt+tz7OIx/6uK3AxYGH4moQHLBopMkg3RsoDP7itJzcxPwLuzvH8iMARCYbKZUV9SYDt0hbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525703; c=relaxed/simple;
	bh=USkddxp1KIfa0fMdR/UUWCcd+m+f+tEbQoZfQXfmDbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiWP2SWZMARRrm+w8bqUE4zLHM7f+j+Jh1U71HcaHMsuABlDxEO15N/kiV9owyS6VMll+wuQYm/og0Ghx6CxHkJBxZIt7tks71jPdnLNRsHs01hrItA4gdP303/cKqgWaUCL2U7EzeXJBXmfZ6pmOmOo0IueR59uFaeNVTAFrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bRMAcNDV; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bRMAcNDV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786525692; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=QktvlERZxBJ2P8shSXSLCS6QAutmsxZN1xlh6/xfq5U=;
	b=bRMAcNDV3Udffa4rxspce/GVevKh5bnpD/0402FcSeysuZsDAjHGh9rPudbAc27hKzO458UboTEploUAig9xT8ZGGz16m5auN9oov6/rfvQi/eYxV/xsIq1ZKyLO+DMJ1guLcd+u573ALpp9LdWnzQ4/50qWxkS+CprCK9sEtYM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0X8r4Edj_1786525691;
Received: from 30.178.83.207(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X8r4Edj_1786525691 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 17:08:12 +0800
Message-ID: <892c037a-49c5-415b-8c7a-b8846e34d7df@linux.alibaba.com>
Date: Wed, 12 Aug 2026 17:08:10 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cxl/cdat: Fix uninitialized stack use in bandwidth
 gathering
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
References: <20260812083035.372308-1-kanie@linux.alibaba.com>
 <20260812083035.372308-2-kanie@linux.alibaba.com>
 <20260812084459.07B941F000E9@smtp.kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <20260812084459.07B941F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/8/12 16:44, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Zero-initializing `ep_coord` codifies a logic error where valid PCI bandwidth is discarded if CDAT bandwidth is unreported (0), contradicting subsystem conventions.
> - [High] The cxl_port_perf_data_calculate() function declares an uninitialized access_coordinate array on the stack, which is leaked to userspace via sysfs for Restricted CXL Devices (RCDs).
> --
>
> --- Patch [1]: [PATCH v3 1/2] cxl/cdat: Fix uninitialized stack use in bandwidth gathering ---
> commit ecbce27f92f7e67349081889c3ca38eb48761104
> Author: Guixin Liu <kanie@linux.alibaba.com>
> Subject: cxl/cdat: Fix uninitialized stack use in bandwidth gathering
>
> This commit fixes uninitialized stack usage in cxl_endpoint_gather_bandwidth()
> and cxl_switch_gather_bandwidth() by zero-initializing the access_coordinate
> arrays. It prevents uninitialized kernel stack data from being exposed as
> bandwidth and latency figures.
>
>> diff --git a/drivers/cxl/core/cdat.c b/drivers/cxl/core/cdat.c
>> index 5c9f072625135..df9261ba84e5a 100644
>> --- a/drivers/cxl/core/cdat.c
>> +++ b/drivers/cxl/core/cdat.c
>> @@ -633,9 +633,9 @@ static int cxl_endpoint_gather_bandwidth(struct cxl_region *cxlr,
>>   	struct cxl_port *endpoint = to_cxl_port(cxled->cxld.dev.parent);
>>   	struct cxl_port *parent_port = to_cxl_port(endpoint->dev.parent);
>>   	struct cxl_port *gp_port = to_cxl_port(parent_port->dev.parent);
>> -	struct access_coordinate pci_coord[ACCESS_COORDINATE_MAX];
>> -	struct access_coordinate sw_coord[ACCESS_COORDINATE_MAX];
>> -	struct access_coordinate ep_coord[ACCESS_COORDINATE_MAX];
>> +	struct access_coordinate pci_coord[ACCESS_COORDINATE_MAX] = { };
>> +	struct access_coordinate sw_coord[ACCESS_COORDINATE_MAX] = { };
>> +	struct access_coordinate ep_coord[ACCESS_COORDINATE_MAX] = { };
> [Severity: High]
> This isn't a bug introduced by this patch, but does zero-initializing
> ep_coord codify a logic error where valid PCI bandwidth is discarded?
>
> If an endpoint CDAT does not report bandwidth, the bandwidth fields in
> perf->cdat_coord will be 0. When cxl_coordinates_combine() is called later
> in cxl_endpoint_gather_bandwidth():
>
> 	rc = cxl_pci_get_bandwidth(pdev, pci_coord);
> 	if (rc < 0)
> 		return rc;
>
> 	/*
> 	 * Min of upstream link bandwidth and Endpoint CDAT bandwidth from
> 	 * DSLBIS.
> 	 */
> 	cxl_coordinates_combine(ep_coord, pci_coord, perf->cdat_coord);
>
> The __cxl_coordinates_combine() helper requires both inputs to be non-zero
> to assign the output:
>
> 	if (c1->write_bandwidth && c2->write_bandwidth)
> 		out->write_bandwidth = min(c1->write_bandwidth,
> 					   c2->write_bandwidth);
>
> Because the bandwidth in perf->cdat_coord is 0, ep_coord remains untouched
> (which is now 0). This completely discards the valid upstream link
> bandwidth in pci_coord, resulting in an erroneous region aggregate
> bandwidth of 0.
>
> [Severity: High]
> This is a pre-existing issue, but while fixing uninitialized stack
> variables, did you notice a similar leak in cxl_port_perf_data_calculate()
> in drivers/cxl/core/cdat.c?
>
> It declares an uninitialized array:
>
> 	struct access_coordinate ep_c[ACCESS_COORDINATE_MAX];
> 	...
> 	rc = cxl_endpoint_get_perf_coordinates(port, ep_c);
>
> If the device is a Restricted CXL Device (RCD),
> cxl_endpoint_get_perf_coordinates() in drivers/cxl/core/port.c returns 0
> early without initializing the array:
>
> 	/*
> 	 * Skip calculation for RCD. Expectation is HMAT already covers RCD case
> 	 * since RCH does not support hotplug.
> 	 */
> 	if (cxlmd->cxlds->rcd)
> 		return 0;
>
> cxl_port_perf_data_calculate() then passes this uninitialized array to
> cxl_coordinates_combine(), which can leak kernel stack memory to userspace
> via world-readable sysfs region attributes.
On the RCD leak in cxl_port_perf_data_calculate(): that is what patch 2 of
this series fixes. cxl_endpoint_get_perf_coordinates() now zeroes the
caller's array before the early return for RCDs, so ep_c[] is no longer read
before anything writes it. The fix is in the exported helper rather than in
the caller because the helper documents @coord as an output parameter, and
cxl_test discards its return value.

On ep_coord being discarded when the CDAT reports no bandwidth: the guard
that skips the assignment, "if (c1->write_bandwidth && c2->write_bandwidth)"
in __cxl_coordinates_combine(), is pre-existing and untouched by this patch.
What the patch changes is only what remains in the output when that guard
skips: stack residue before, zero now. A zero bandwidth is how that helper
already spells "not reported" - that is why the guard exists, since min()
against an unknown value is meaningless. Making the combine step fall back
to one input instead would change the meaning of the helper for all of its
callers, which is a separate discussion from not reading uninitialized
stack. The cover letter says the same about the aliasing question raised on
v2.

Best Regards,
Guixin Liu

