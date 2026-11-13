Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542340;
	b=ezlEqvV74Iju3AxEVKNl9pVxM7WOrQx6K/5+rxkGeIupzLs4yC9gVEuhfpTIyksGXkUr
	 5VUNx2ZzEbeNhYEXjXNCoKGvgshvs0SSf51i36dwWg5k18r/s+sc4N2YsxRWMHEHF8Cl9
	 uigMT4N0o1qTAscZdWAKd3PRAMQFMIZH9B6NOf5ChvYnf3nThAuA1Sw6ta1EW+UWCaDIQ
	 WNUqbC9ICteB5Vpf36h1IhMz0hkKuVrVJQewKf0GsHRRF0NTG8MfkgRPRx8+V8agkQFCc
	 xaIxw4Jbt2BPmvxmiB1S6js/bvRaJraRTBKaPrzH+0dGq6YTHdWxhBkjPqYasnD/v4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542340;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=2JUOfsFOfJEmlaAFTpTaKsBmsfTT4SLC4fGYq4jy5VE=;
	b=G295iRaHht+UKj1qfdivt27HZGHg0Ds+3k6+MRbShsI3MuJBa0BpOkXANFOFBSbOSeKF
	 fyZ76YxrAtYC2WXGn39dsSuXxARKe7HdB8rRC5H95sSS7fLHTVOjaVd87ZVSCaus7ccs8
	 6FIIH3VDNUWRanMwC18vncq0pyGViQVA3TuOH8P5gXDZkvwBfJFKksT9yCFOKbgPavnf4
	 ucUwnPWh8XJ9OXO1tE/jn26WnTLwT71s8MGkm+Scy1EW+/lNOjPTZpFeoKzEUI3hCVF76
	 H9tDeXAGwMrl3Pb4oPo76r6pV4ONgleOLh6bB5MZYVdc0c3JdxiiNik5u91gpOzyvLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lyxm9tmi;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9D606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 03:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Lyxm9tmi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=2JUOfsFOfJEmlaAFTpTaKsBmsfTT4SLC4fGYq4jy5VE=;
	b=Lyxm9tmihZjGz8crX5pRuB65/Xtrx2bBsgaelAvvffoJzTvD7w8G18j7HLR94S
	bSAwEt6dzdt8Nf/YUB0U2imtO+rft0IVW8zhSCtLvI/Mfq5D/bQpesoMHU7JSnuQ
	DSRrIYM6ib3ovh2hArvCiOOAK8XUCT2AxdxcXvGyAYrnM=
Message-ID: <b2ddd82c-7f07-4845-be0d-dce2c4ffb679@163.com>
Date: Fri, 13 Nov 2026 11:58:20 +0800
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
Subject: Re: [PATCH] selftests/mm: Handle implicit read permissions in
 madv_populate
To: sashiko-reviews@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 chenxionggui@lanxincomputing.com
References: <20261112031811.56500-1-evers_chen@163.com>
 <sashiko-outbox-212131@kernel.org>
Content-Language: en-US
From: cxg <evers_chen@163.com>
In-Reply-To: <sashiko-outbox-212131@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3_0XcivZqFta+Hg--.3699S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF18XF1DZF43KFWUWr1kGrg_yoWrJr48pa
	yxJ3WYyr47Gw12yw4vyw4xXr1xKFs3GFW8X348tryFv3sIkFn7WrW8Ka45Kas5AFZYqw1Y
	vas8Casxuw1qyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um9aPUUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7B0yPGr2it3HVQAA3m

Hi Andrew,

Thanks for improving the changelog and picking up the patch.

I noticed that the original madv_populate test was introduced by commit 
e5bfac53e310. Would it make sense to add the following Fixes tag?

Fixes: e5bfac53e310 ("selftests/vm: add test for 
MADV_POPULATE_(READ|WRITE)")

I also tested an alternative implementation using the existing procmap 
helpers, as suggested by Sashiko. It passes all 17 tests on RISC-V with 
Linux 7.2.0.

However, since PROCMAP_QUERY requires a relatively recent kernel, 
keeping the current /proc/self/maps implementation may be preferable for 
compatibility with older kernels.

Thanks,
Xionggui


On 11/13/26 11:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] selftests/mm: custom /proc/self/maps parser in
>    mapping_is_readable()
> - [Low] selftests/mm: missing Fixes trailer for test_prot_write()
>    failure
> --
>
> commit 3592bfa7e9663819c643afaf7d6c337f6b102d15
> Author: Xionggui Chen <chenxionggui@lanxincomputing.com>
>
>> selftests/mm: Handle implicit read permissions in madv_populate
>>
>> The madv_populate selftest assumes that a mapping created with
>> PROT_WRITE cannot be read, and expects MADV_POPULATE_READ to fail
>> with EINVAL.
>>
>> However, some architectures, including RISC-V, may implicitly grant
>> read permission to PROT_WRITE mappings. On such architectures,
>> MADV_POPULATE_READ succeeds, causing the test to fail incorrectly.
>>
>> Check the actual VMA permissions through /proc/self/maps and adjust
>> the expected result accordingly.
>>
>> Add a PROT_NONE test to verify that MADV_POPULATE_READ still fails
>> with EINVAL for mappings without read permission.
>>
>> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16
>> tests, while the updated test passes all 17 tests.
>>
>> Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
> [Severity: Low]
> Should this commit include a Fixes: tag for the test it fixes?
>
>    Fixes: e5bfac53e310 ("selftests/vm: add test for MADV_POPULATE_(READ|WRITE)")
>
>> diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
>> index 7fce5d0b622be..818f99ee20041 100644
>> --- a/tools/testing/selftests/mm/madv_populate.c
>> +++ b/tools/testing/selftests/mm/madv_populate.c
>> @@ -69,10 +69,38 @@ static void test_prot_read(void)
>>   	munmap(addr, SIZE);
>>   }
>>   
>> +static int mapping_is_readable(void *addr)
>> +{
>> +	FILE *maps;
>> +	char line[256];
>> +	unsigned long start, end;
>> +	char perms[5];
>> +	int readable = -1;
>> +
>> +	maps = fopen("/proc/self/maps", "r");
>> +	if (!maps)
>> +		return -1;
>> +
>> +	while (fgets(line, sizeof(line), maps)) {
>> +		if (sscanf(line, "%lx-%lx %4s",
>> +			   &start, &end, perms) != 3)
>> +			continue;
>> +
>> +		if (start <= (unsigned long)addr &&
>> +		    (unsigned long)addr < end) {
>> +			readable = perms[0] == 'r';
>> +			break;
>> +		}
>> +	}
>> +
>> +	fclose(maps);
>> +	return readable;
>> +}
> [Severity: Low]
> Could mapping_is_readable() reuse the shared VMA helpers in vm_util.h
> instead of open-coding a /proc/self/maps parser?
>
> madv_populate.c already includes vm_util.h and links against vm_util.c,
> which provide open_self_procmap(), find_vma_procmap(), and close_procmap()
> (exposing PROCMAP_QUERY_VMA_READABLE in procmap.query.vma_flags) as well as
> check_vmflag(addr, "rd").  Reusing those avoids duplicating VMA lookup logic
> and avoids line truncation on mappings with paths longer than 256 bytes.
>

