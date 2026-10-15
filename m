Received: from mta0.migadu.com (out-133.mta0.migadu.com [91.218.175.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8E3A5438
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079158; cv=none; b=aCaFbtO2dX676Hx1auLX/yvExtHanzzbOSJID0oXS+uWkit0fELbhbOJgctG9Bqe7HJ3zH9LDULs3nvAXSQpzStjUFUMVoVlXmssD/fBBRaTbtJZVBYQbJru7oT5rsIVrmI0bxiFh2CE3IPZ6Uzxhr4Ne6h9B7t3++3DPsHhCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079158; c=relaxed/simple;
	bh=POooulujnIkLHWEyPmLNc//oQqLDg4iHcaq7ZUi7onw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RMaKoSHzBt3f5M7i6ZHLDJD8KiVtcaEjpJV0qmjZsgmjrpgEzy6EMCUaDrnwZjfPrjBdvxLja/l8JPEWO9FsO1SgG/4oEFBEtQwBVVKLtq3S/lDPP375DHwiH55C0IEF6ddhHpu8DSu+HBcPbci7TnlDkKeWOvStGHixhk/sw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pAlV+3N8; arc=none smtp.client-ip=91.218.175.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pAlV+3N8"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=POooulujnIkLHWEyPmLNc//oQqLDg4iHcaq7ZUi7onw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792079146; v=1; x=1792683946;
 b=pAlV+3N8RGhjha4fdNsbNMPKaARDsE/Gn65r6Q8SD+susVQHY+soiM6YGSbNTXhC1MNX6YnL
 40TLg0Fpm3CqdP3w1cp+G7kfhqbf6CIX4fimzaUpesFU8WWAnU1UV/dGqSpJbaEfGRv6DeSLVzX
 Pz2w878LUAGO02CQS6E234IA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a8122fc183ca982b;
	Thu, 15 Oct 2026 15:45:31 +0000
X-Mizu-Trace-ID: a8122fc183ca982b
X-Migadu-Flow: FLOW_OUT
Message-ID: <9562d352-61f6-43c3-8ed3-3dc89140d317@linux.dev>
Date: Thu, 15 Oct 2026 08:45:25 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v11 19/26] libbpf: Add cleanup_info to
 bpf_prog_load_opts
To: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
References: <20261015040143.854070-1-yonghong.song@linux.dev>
 <20261015040321.864586-1-yonghong.song@linux.dev>
 <sashiko-outbox-172238@kernel.org>
Content-Language: en-GB
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <sashiko-outbox-172238@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/14/26 9:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] bpf: multi-line comment style violation in bpf_prog_load_opts
> --
>
> commit 7622c492adc459370a78a700a25047031969a083
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> libbpf: Add cleanup_info to bpf_prog_load_opts
>
> This commit expands bpf_prog_load_opts to include an exception cleanup
> table. It adds cleanup_info_cnt, cleanup_info, and cleanup_info_rec_size
> fields, which are then passed to the kernel via bpf_prog_load.
>
> [ ... ]
>
>> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
>> index 826d9cc9ab65d..64699e0e4e1a8 100644
>> --- a/tools/lib/bpf/bpf.h
>> +++ b/tools/lib/bpf/bpf.h
>> @@ -128,9 +128,17 @@ struct bpf_prog_load_opts {
>>   
>>   	/* if set, provides the length of fd_array */
>>   	__u32 fd_array_cnt;
>> +
>> +	/* exception cleanup table: cleanup_info_cnt records of
>> +	 * cleanup_info_rec_size bytes each (struct bpf_cleanup_info),
>> +	 * holding instruction indices into insns
>> +	 */
> [Severity: Low]
> This isn't a bug, but does this multi-line comment follow the preferred
> BPF subsystem style? The subsystem guidelines strictly require that the
> opening /* for multi-line comments be placed on its own line.
>
> Could this be formatted as follows to match the standard?
>
> /*
>   * exception cleanup table: cleanup_info_cnt records of
>   * cleanup_info_rec_size bytes each (struct bpf_cleanup_info),
>   * holding instruction indices into insns
>   */

This is a format issue. Can be a follow up or as is.

>
>> +	__u32 cleanup_info_cnt;
>> +	const void *cleanup_info;
>> +	__u32 cleanup_info_rec_size;
>>   	size_t :0;
>>   };

