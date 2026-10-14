Received: from mail-m12773.qiye.163.com (mail-m12773.qiye.163.com [115.236.127.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A804A8A18
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968322; cv=none; b=pADXPuRyzqZg51l9lWMZeCLFMudMo3TOMb2yNUIG+Arq6Q6Ou0wEExOHGAh5NJSNpanTyNJMx44QHP6J+HinFpDCSclqhLawPNVyQhxEsJBkyIsDOu5UJY5pZhfwRfQRXMr1tuGEHwYEoNZYolWE5sC8afOac651JrFuSQ3v238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968322; c=relaxed/simple;
	bh=JCu+SmE7DaT4V8bV1ux3Fq22uikv5xMskoz7V+kge5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXhsFPo1/t2bI9nGbWMN043twUNosjhiYvQHKkP9o+pfzeLMUywGNccnnnQgqgXu0vbq0pXhMigQdBnD5Dvb/5I0WO/V1nG0dn023ODkK3R75mXn/kpoR6BtETAD6WPh6Ft/TpTQLUOGPpZeSCR2C3xNKZG3mSs+1aNxycaKMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=115.236.127.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from [192.168.0.59] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 200da6bab;
	Wed, 14 Oct 2026 16:53:19 +0800 (GMT+08:00)
Message-ID: <3856c10f-6e18-4dda-8b3a-085f246e3bbd@easystack.cn>
Date: Wed, 14 Oct 2026 16:53:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] selftests/bpf: add tests for the page_owner
 bpf_iter target
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261013122125.843451-1-zhen.ni@easystack.cn>
 <20261013122125.843451-7-zhen.ni@easystack.cn>
 <sashiko-outbox-169725@kernel.org>
From: "zhen.ni" <zhen.ni@easystack.cn>
In-Reply-To: <sashiko-outbox-169725@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1399db6500229kunm51b7ee5849e2b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkofVkhCH09KTU9DGUkYQ1YVFA
	kWGhdVGRETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG



在 2026/10/13 20:38, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] bpf/selftests: hardcoded errno values break architecture portability
> --
> 
> commit d63d4254b64f243f696e8d9b4ca8b07f371d8139
> Author: Zhen Ni <zhen.ni@easystack.cn>
> 
> selftests/bpf: add tests for the page_owner bpf_iter target
> 
> This commit adds a sleepable BPF program and a userspace runner to test
> the seq_file and open-coded page_owner iterators. It verifies iterator
> parity, output matching, and kfunc contracts including memcg classification.
> 
>> diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_page_owner.c b/tools/testing/selftests/bpf/progs/bpf_iter_page_owner.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/bpf_iter_page_owner.c
> [ ... ]
>> +char memcg_pathbuf[4096];
>> +char memcg_first_path[4096];
>> +char memcg_first_name[80];
>> +
>> +#define MEMCG_ENODATA 61
>> +#define MEMCG_EOPNOTSUPP 95
>> +
>> +#define MEMCG_F_ONLINE	(1 << 0)
>> +#define MEMCG_F_OBJCG	(1 << 1)
> 
> [Severity: Medium]
> Will these hardcoded errno values cause a regression in the selftests on
> certain architectures?
> 
> The bpf_page_owner_get_memcg_info() kfunc returns standard kernel error
> codes like -ENODATA and -EOPNOTSUPP. However, these error codes vary by
> architecture. For example, ENODATA is 111 on SPARC and 86 on Alpha, while
> EOPNOTSUPP is 122 on MIPS.
> 
> When the test runs on these architectures, the kfunc will return the
> architecture-specific error code. This will fail the hardcoded comparison
> in check_memcg(), incorrectly incrementing memcg_bad and causing the
> selftest to fail.
> 

I'll use `-ENODATA`/`-EOPNOTSUPP` instead of the hardcoded.
Will fix it.


Thanks,
Zhen
