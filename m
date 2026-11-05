Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857509;
	b=ZlDcPGApJrOlyHa3jOPh9u+qaJo4ssttXC8cuQyrXHJl9KuDNLU+gh8uSOPrBQ82OV17
	 qCx5see9TCm9Mzw4CoAfkhEM4GSyvl7344W9poLg2Te9nG1YMJ662QRkURlaDIlbvWIdL
	 6LCQ1YcG8o28EjYBx4lgyf9C770ttKpgTQf1au+nMAn8uaKNGnk2XCzbGZ+0fZsizUCj/
	 1X6YU1edgAIxWMTfjhUlynrRz9uPQMz3+9lYz7dgq5ONZ6OWRxJ0tdCYaWgHovls5/hXH
	 azM+xzfmh/tpKbzfixVV4PIwcXvjyWnaRJoaam5NLJtke0B69OcPaheQ3JoN/3dBL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857509;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yFKARAPhapz1J/TE9qnmiMZza1QjYae5bhZ4iVqttg4=;
	b=haKzUFQlXLPPOI+wonar/nGMRR/KVCvEn6gUJX88djixu1S8bkOWk91B9l9fVpIQAODY
	 YBPba97QB9vQrV8/R4gubJiKhpG9NnbNINjV/yWoTjyZMsw4atNEI8zMpotuCRYxkE7ZY
	 h6GZM2cz3kBtHREu/uJZvA6diRQY2eJjyeeBJ7anzB21/Js4EojLCGTCL4UG05oDs5aug
	 qrhaUHBhzDJD/8OXIi8RkgUBaKUx/t8OTG5oRYTRuETX4ehFNce5BJ3WbG4Z6zbb0BiW3
	 w5OwddOveMS/jGS1whWku0zO9vNNdBzqiJo++WR3DTM6Wo4QZehSFY9N55PsSZoXQAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC1606A32D
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 05:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71CC1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 08295878d8dc11f19a56ed5b684f684d-20261105
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5cb1efd1-3617-4c36-bbc9-ecfa8a2730ba,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:5cb1efd1-3617-4c36-bbc9-ecfa8a2730ba,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:6a52fa801b42c128cd7cfb76e3faa236,BulkI
	D:261105112459LV42W7SB,BulkQuantity:1,SF:17|19|64|66|78|80|81|82|83|102|12
	7|153|841|865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2|1,URL:0,File:nil,
	RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DK
	P:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_IBB
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08295878d8dc11f19a56ed5b684f684d-20261105
X-User: tianyaxiong@kylinos.cn
Received: from [10.42.13.21] [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <tianyaxiong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1092795518; Thu, 05 Nov 2026 13:44:56 +0800
Message-ID: <e60a0b6c-85c1-424d-ae57-a7239e4ef776@kylinos.cn>
Date: Thu, 5 Nov 2026 13:44:33 +0800
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
Subject: Re: [PATCH v2] ftrace: speed up module enable by binary searching
 module symbols
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
References: <20261105031530.280442-1-tianyaxiong@kylinos.cn>
 <sashiko-outbox-198512@kernel.org>
Content-Language: en-US
From: Yaxiong Tian <tianyaxiong@kylinos.cn>
In-Reply-To: <sashiko-outbox-198512@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2026/11/5 11:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] ftrace: undeclared function is_ignored_kernel_symbol() breaks build
> --
>
> commit 4bde25e1c49a34cddab8dbd106c29413a3f1f699
> Author: Yaxiong Tian <tianyaxiong@kylinos.cn>
>
> ftrace: speed up module enable by binary searching module symbols
>
> This commit speeds up ftrace_module_enable() by collecting and sorting a
> module's symbol addresses once and binary searching them to validate
> ftrace records instead of linearly scanning the module symbol table for
> each record.
>
>> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
>> index c7d74b33d36de..255e813fe70e1 100644
>> --- a/kernel/trace/ftrace.c
>> +++ b/kernel/trace/ftrace.c
>> @@ -26,6 +26,7 @@
>>  #include <linux/uaccess.h>
>>  #include <linux/bsearch.h>
>>  #include <linux/module.h>
>> +#include <linux/module_symbol.h>
>>  #include <linux/ftrace.h>
>>  #include <linux/sysctl.h>
>>  #include <linux/slab.h>
>> @@ -8034,8 +8035,129 @@ void ftrace_release_mod(struct module *mod)
>>  	}
>>  }
>>  
>> +#ifdef FTRACE_MCOUNT_MAX_OFFSET
> [ ... ]
>
>> +static struct ftrace_mod_syms *ftrace_mod_syms_alloc(struct module *mod)
>> +{
>> +	struct mod_kallsyms *kallsyms;
>> +	struct ftrace_mod_syms *syms;
>> +	unsigned int i, nr = 0;
>> +
>> +	/*
>> +	 * mod->kallsyms stays valid until do_init_module() replaces it later
>> +	 * in this thread, so no RCU read-side section is needed.
>> +	 */
>> +	kallsyms = rcu_dereference_raw(mod->kallsyms);
>> +
>> +	if (!kallsyms || kallsyms->num_symtab < 2)
>> +		return NULL;
>> +
>> +	syms = kvmalloc(struct_size(syms, addr, kallsyms->num_symtab),
>> +			GFP_KERNEL);
>> +	if (!syms)
>> +		return NULL;
>> +
>> +	/* The symbols find_kallsyms_symbol() would consider. */
>> +	for (i = 1; i < kallsyms->num_symtab; i++) {
>> +		const Elf_Sym *sym = &kallsyms->symtab[i];
>> +		const char *name = kallsyms->strtab + sym->st_name;
>> +
>> +		if (sym->st_shndx == SHN_UNDEF || !*name ||
>> +		    is_ignored_kernel_symbol(name))
>> +			continue;
> [Severity: Low]
> Does this break the build on architectures defining FTRACE_MCOUNT_MAX_OFFSET
> (such as x86 with CONFIG_HAVE_FENTRY or powerpc)?
>
> ftrace_mod_syms_alloc() calls is_ignored_kernel_symbol(), which is not
> declared or defined in any kernel header in this tree. In
> include/linux/module_symbol.h, the helper is still named is_mapping_symbol():
>
> include/linux/module_symbol.h:
> static inline bool is_mapping_symbol(const char *str)
> {
> 	if (str[0] == '.' && str[1] == 'L')
> 		return true;
> 	if (str[0] == 'L' && str[1] == '0')
> 		return true;
> 	return str[0] == '$';
> }
>
> and find_kallsyms_symbol() in kernel/module/kallsyms.c calls
> is_mapping_symbol():
>
> kernel/module/kallsyms.c:find_kallsyms_symbol() {
> 	...
> 		if (*kallsyms_symbol_name(kallsyms, i) == '\0' ||
> 		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
> 			continue;
> 	...
> }
>
> Should ftrace_mod_syms_alloc() call is_mapping_symbol(name) here instead?
This v2 is based on v7.4-rc1: the patch's index line is
c7d74b33d36d..255e813fe70e, and c7d74b33d36d is
HEAD^:kernel/trace/ftrace.c in that tree.

is_mapping_symbol() no longer exists on that base.  Commit db91da8f0518
("module/kallsyms: Rename is_mapping_symbol() to
is_ignored_kernel_symbol()")
is in v7.4-rc1; on that base include/linux/module_symbol.h defines
is_ignored_kernel_symbol(), and find_kallsyms_symbol() uses it.

The hunk you quote (is_mapping_symbol) is from the v1 base
673a54fdf392, which predates that rename.  The patch compiles and runs on
x86_64, which defines FTRACE_MCOUNT_MAX_OFFSET.  powerpc defines the same
macro but uses the same common helper declaration, so there is no
arch-specific issue.

If the review tree is older than v7.4-rc1, then is_mapping_symbol() is the
right name for that tree and the patch needs a rebase there -- but that is
not the base of this posting.
>
