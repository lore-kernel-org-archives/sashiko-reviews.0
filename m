Received: from mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28E370AC6
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000428; cv=none; b=TkFURbvB4KZEr3t0ZehCpO+Wa0xTmkrEgdw5PRiVelB64s8E+/hL5m0Szuc25IBteJRyJf+w3y7Uk18MD7yW/NNGHI+LTxYolEbtjPavLsLeJszr8MLhghAl5TjboZC2gUFl9r4t1UJ623+XZtOGFr2ltEvz+PWMDmOigsxbf6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000428; c=relaxed/simple;
	bh=Z6+lbQSfsts1seFo97lTcVu3MuMtDNhLODH15/zqHCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxm2WEW20Y3aohWIB/579hygkzODkE6oLwJBiZGjyaByQhB9DozzGHey6brXfPt9GiGkonuY+iQIsWJkZuXX7THULxKdLjPnE1fEmWeYdAmttYDmzYjRw0jDB4d5ajVD0eZLnt7K8118w4IP3I5/F05InSgTzWz8uNAUPohNZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nj/+VIjU; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nj/+VIjU"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Z6+lbQSfsts1seFo97lTcVu3MuMtDNhLODH15/zqHCA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790000424; v=1; x=1790605224;
 b=nj/+VIjUK6slzKfQw3m2hQOltOixLUVaRgTq2Ij05zZVPrgKywa2yXtmx8SXaDbQFEmSHs7Q
 ZBYr4h5qraWpfQQN4iiffAY0Tl3XVNXaWLS3tjIvl1Mfn7M3GUkDtfp9V4lwGmJFQhiwpRAMNUm
 eG4CbkBMWk7Yr01HvKK3rIvM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d936da47445c78c3;
	Mon, 21 Sep 2026 14:20:24 +0000
X-Mizu-Trace-ID: d936da47445c78c3
X-Migadu-Flow: FLOW_OUT
Message-ID: <a5ac138b-f857-4b6b-aaa9-1695b4b877e6@linux.dev>
Date: Mon, 21 Sep 2026 07:20:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 17/20] libbpf: Let the static linker carry
 .bpf_cleanup relocations
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260920054225.864535-1-yonghong.song@linux.dev>
 <20260920054353.872669-1-yonghong.song@linux.dev>
 <20260920060026.6349C1F000FF@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260920060026.6349C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/19/26 11:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] libbpf: integer overflow in relocation bounds check allows out-of-bounds heap access
> - [Low] libbpf: incompatible pointer cast to __u32 * violates strict aliasing
> - [Low] bpf: newly added multi-line comments violate the BPF kernel comment style
> --
>
> commit c31e91765bc81fed1c51952c88d0792cd3b4c2bd
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> libbpf: Let the static linker carry .bpf_cleanup relocations
>
> This commit updates the static linker to accept and properly handle
> R_BPF_64_NODYLD32 and R_BPF_64_ABS32 relocations against STT_SECTION
> symbols in non-executable sections. This enables linking of objects
> that contain compiler-emitted exception cleanup tables.
>
>> diff --git a/tools/lib/bpf/linker.c b/tools/lib/bpf/linker.c
>> index 78f92c39290af..fac7390bd109d 100644
>> --- a/tools/lib/bpf/linker.c
>> +++ b/tools/lib/bpf/linker.c
> [ ... ]
>
>> @@ -2274,6 +2275,39 @@ static int linker_append_elf_relos(struct bpf_linker *linker, struct src_obj *ob
>>   						insn->imm += sec->dst_off / sizeof(struct bpf_insn);
>>   					else
>>   						insn->imm += sec->dst_off;
>> +				} else if (sym_type == R_BPF_64_NODYLD32 ||
>> +					   sym_type == R_BPF_64_ABS32) {
>> +					__u32 *val;
>> +
>> +					/* Two spellings of the one thing: LLVM
>> +					 * emits NODYLD32 for a .long against a
> [Severity: Low]
> Does this multi-line comment format violate the BPF subsystem guidelines? The
> BPF guidelines specify that multi-line comments must have the opening /* on
> its own line, with the text starting on the next line.
>
>> +					 * section symbol, GNU as emits ABS32
>> +					 * (bpf_reloc_type_lookup() maps
>> +					 * BFD_RELOC_32 to it), and the value
>> +					 * they describe is the same.
>> +					 */
>> +
>> +					/* An SHT_NOBITS section has no
>> +					 * raw_data, and r_offset is sanity
> [Severity: Low]
> This isn't a functional issue, but this comment also places text on the same
> line as the opening /*.
>
>> +					 * checked only for sections holding
>> +					 * instructions. Check both here
>> +					 * before writing.
>> +					 */
>> +					if (!dst_linked_sec->raw_data ||
>> +					    dst_rel->r_offset % sizeof(*val) ||
>> +					    dst_rel->r_offset + sizeof(*val) >
>> +					    (size_t)dst_linked_sec->sec_sz) {
> [Severity: High]
> Can this bounds check bypass validation due to an integer overflow?
>
> If a malicious BPF ELF object provides an oversized r_offset (for example,
> 0xFFFFFFFFFFFFFFFC), adding sizeof(*val) could wrap around to 0. This bypasses
> the check against dst_linked_sec->sec_sz and allows out-of-bounds heap memory
> access.

Yes, overflow is possible. Will fix.

>
>> +						pr_warn("ELF relo #%d in section #%zu points outside the data of section '%s' in %s\n",
>> +							j, src_sec->sec_idx,
>> +							dst_linked_sec->sec_name,
>> +							obj->filename);
>> +						return -EINVAL;
>> +					}
>> +					val = dst_linked_sec->raw_data + dst_rel->r_offset;
>> +					if (linker->swapped_endian)
>> +						*val = bswap_32(bswap_32(*val) + sec->dst_off);
>> +					else
>> +						*val += sec->dst_off;
> [Severity: Low]
> Does casting the raw byte buffer to a __u32 pointer violate strict aliasing
> rules?
>
> The tools/ build assumes strict aliasing, and accessing generic byte buffers
> this way can lead to compiler misoptimization. Would it be safer to use memcpy
> or unaligned access macros here?

I think it should be okay. In the above we have
   struct bpf_insn *insn;
   ...
   insn = dst_linked_sec->raw_data + dst_rel->r_offset;

>
>>   				} else {
>>   					pr_warn("relocation against STT_SECTION in non-exec section is not supported!\n");
>>   					return -EINVAL;

