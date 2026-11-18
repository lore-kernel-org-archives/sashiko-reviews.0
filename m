Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989058;
	b=VGqeuA+QcD4aplfLZjo9bywCrMe5GSSqBoIMYRD+8eKEDxgHmrZdQk+uY/wP294wSJqm
	 pnU+tRXG3QPBBVKuW40JVhbGdrxrguccoJcAnrub4mY5wmtSJj6+cmYabiZArna0EseCQ
	 0chYakUwgfzcaB17WwDERVDgqIdSFx5tD0oRFv00lXDqVscqQwyKG56kq9B+yza2CJvYS
	 bjJvDf1G5Npqb1zQgqWa9oVI2bYXAPbVYrdlQSj8kBDrZ/v53btTiJl67GebdgV5H9xTn
	 Pn3UozHrbmq6bzl6kuRDrtLfHCVn7lfeSp8v81OCnQB+EfbjqIGI6F3rUVTJvGDBDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989058;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=VmfBxwAiycnX976kOf40RwA8Wkvw1aPxgwJ9mlg6QGU=;
	b=xJJ7VZOnKYdfNkHyLbhyr+TOS4vVEXMnEF9ZS3JEmD3iMnK1gQP6IqLdoajkLDkZaC3k
	 d/AXA1eN+5bwsDA0fP6BSovMTHnvVVfet/qCSLEdVCbe9N40yQEfQ97nZpRGHcT+qiKGp
	 SbUegiuNTl+RtPk8+jL8e1H5ZvXjxQocWhbGWpywT+77G9yPYTvjnZNwEfopnPwGD2RrY
	 e0X1X/4lby09P94pa5Y+Cfu9FGbE0/cDkxrIpsmSIMmW/QM2VW2KuAKahlAHrvrrngJJu
	 9+PqwReCWxGHx1+wgLrV1qGD/dMs5S1tpwn3osmsAporYxKGwbCKuqiMymr6s0gxKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q+yhGXCj;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB2606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BB2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q+yhGXCj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VmfBxwAiycnX976kOf40RwA8Wkvw1aPxgwJ9mlg6QGU=;
	b=Q+yhGXCjBeMdLEbk57TqADLtOejSs+ReSTTer/UpRB3jI17A6D9VfPSrNNPjee
	79lued6lEb18IrQgw+YSE/iMLT9kSOX2Cq/UPhERDLzizhr2zX4R8dA1ygXJo3D3
	DjpOGiJeuktNjkC1kfXFYohAkZfJI21K9p1K4lXQ6rTKM=
Message-ID: <138084c8-e177-42fb-b37d-7e8342ef309c@163.com>
Date: Wed, 18 Nov 2026 16:03:38 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: handle implicit read permissions in
 madv_populate
To: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org
Cc: david@kernel.org, shuah@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 Xionggui Chen <chenxionggui@lanxincomputing.com>
References: <20261112031811.56500-1-evers_chen@163.com>
 <20261117070606.3752-1-evers_chen@163.com> <sashiko-outbox-220290@kernel.org>
Content-Language: en-US
From: cxg <evers_chen@163.com>
In-Reply-To: <sashiko-outbox-220290@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDn16LaW_1q0gjLIQ--.6744S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyDCw48uryUtrWrAryrWFg_yoW8KF1xpF
	WxWF4Yvan5KF17AasrKr18trykurWfCFs5Xw18tr95ZwsIya48Cry2ga45Kryfta92qwn0
	93Z8ur9xuw1UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmAp5UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7BwoMmr9W9yd8gAA3V

Hi Andrew,

I noticed that the Fixes tag in the patch currently in mm-new points to 
the original selftest commit.

Since the test failure was introduced by the RISC-V VMA permission 
change, the Fixes tag should instead be:

Fixes: 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to VM_READ | 
VM_WRITE")

Could you please update the Fixes tag in mm-new?

The code itself does not need any changes.

Thanks,
Xionggui


On 11/18/26 15:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] selftests/mm: wrong Fixes trailer in madv_populate
>    test_prot_write()
> --
>
> commit a72c4c7dc3b5c0ebca1f3529ca19931b9c980959
> Author: Xionggui Chen <chenxionggui@lanxincomputing.com>
>
>> selftests/mm: handle implicit read permissions in madv_populate
>>
>> The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
>> without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.
>>
>> On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
>> VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
>> with PROT_WRITE. MADV_POPULATE_READ checks this VMA permission, so it
>> succeeds and the test fails incorrectly.
>>
>> Adjust the expected result for RISC-V using an architecture-specific
>> conditional, while preserving the existing behavior on other
>> architectures.
>>
>> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
>> while the updated test passes all 16 tests.
>>
>> Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
>> Fixes: e5bfac53e310 ("selftests/vm: add test for MADV_POPULATE_(READ|WRITE)")
>> Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
> [Severity: Low]
> Should the Fixes: tag point to 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE
> leads to VM_READ | VM_WRITE") instead?
>
> When e5bfac53e310 ("selftests/vm: add test for MADV_POPULATE_(READ|WRITE)")
> added test_prot_write(), mmap(PROT_WRITE) on RISC-V did not set VM_READ and
> MADV_POPULATE_READ returned -EINVAL as expected.  Backporting this change to
> stable trees older than 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
> VM_READ | VM_WRITE") will cause test_prot_write() to fail on RISC-V.
>

