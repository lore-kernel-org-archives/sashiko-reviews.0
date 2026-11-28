Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795832186;
	b=AUb11h6yNX+PG/UZK6/fOlOK+OfIRhET8EC2XWxP2jMsfdjE61+hHjNzqT1QGx+D4JOh
	 Q5po0lmXNWJjwmU4ygDp1ZOA39vvhCh8pQ1prQXYNhmije23errcr9pkCeib7yk+tj22E
	 zFGkEDfq42FqNtTdeG5nQIUsgx5+Tg3zzN6plT0SdHVg/BIrA0wi9V9Xbm7HEklnzpbRm
	 uYTGkb9ri56wUJuk1fs1PDUxq8mmy5NDnBTSomg2lHK549ZdIgRnXOoEMaOyjIYgfZUoC
	 J4f9Yeq6p3kvBnmhm02jSjWv2cvJ/ZKlbE4ZokUG5/U9yZp3td+Kmd5nNFrttn8gAHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To;
	bh=v+AxhUWo7ZwVXmdndnrjQUEctBiASldH/hTh0wDhZIU=;
	b=1K/ibJJ215c9OFYTMV3fcmqQ2V+yvrvwkJf1WUGmZw9XuIpiPj26220R36t5m30zeQul
	 6Nw+rT/Fx/fzS/UsTEVuxluGJIooZlxwUOTseOloNknBHoWYzUy0DyZvGM5wuURwLakmL
	 g3BAHYRBnwZCLxsuoNr5QEhSP30cQwePh6Hf2f2ONDoRniR67D4J4qAex+0M6KlqfQWP6
	 eXBHeNK3rI3BFvdMpn6v2jcn0H+t0LLgZnnZ9Gf/mRcUauel1s5L+i/6sP+yU+ou4g9Zl
	 0uChvlmhJYEzeOEiEGn41vWobXMMQY8nXkwfoP808idCyslg1gz9BWjwuO3d3E3MjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouVderiH;
	arc=none smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D40606A6A1
	for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 02:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D40606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouVderiH
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-48f1c6a7779so5735587fac.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 18:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795832185; x=1796436985; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+AxhUWo7ZwVXmdndnrjQUEctBiASldH/hTh0wDhZIU=;
        b=ouVderiHSK/7G7RWBXRIws2B6YzIIm/F08FegoOYHLLdOjc8Ryt6Ta/Z0fdWlVJCli
         fufCYYG7dbeAtuxEEw4XXbAwNOqckNxGRQpzPubIELMx4CiKHj9eS9MtSFlnNML2BnId
         1uSaxCN44EMgtbSPL7vFysWiHkaqTZhEKFusKl51wTq0BuTXrMIoXYxxaG078IMPQcNB
         DgmN/HKnq4yQWokrY5GDS7qB90oXHEKobIaHi/lfscbaOpFa8W14BcqnplUAOS7Vc0W4
         As2ROJlVIOOVepkeCamDfiuRw3cmrG9kV0Z03j8R3NblR+nvW2ga1roIuQWnsaWGOw3z
         n8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795832185; x=1796436985;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+AxhUWo7ZwVXmdndnrjQUEctBiASldH/hTh0wDhZIU=;
        b=YRnzeEgBFzWs18Erz9Ss6+iP5jePvfWOU9ciGq6lXcxQqOISycAsziX0OH6xt6EpMg
         fvwllaqgSfR6RJk6eEhE/drjN9p0TSyWM9COyGHPOdwWr0F4AnLAo3H/yu8JZOs5CglG
         OVUTNmOXamHxjn3r+fmgGp9Lj8L9L2xLW3AqQTRLC3OXYk3N9h5a3Vr6AFWTguBO5KYl
         JAih3XlEa2qkfESCZqOo1/JCdEkcJLa/u1lleiWxZI9vVpd57Da5EpT6aS9lA1zFb90l
         w91tNqiOdkA7me8m2MUrByTcmTsE7gLCSV5A9Ymfs09MNGYp9pCVMU9FAwnTU3BnNlyr
         soJQ==
X-Gm-Message-State: APuU4Z8IdOFHmMDImgjIbw+wJ74pUz+d2Jsz4jq89dRsjuax3fi0m0t6
	alLrMwknuNMvqiNV3AyF0CQUj9cxqsYFeOzXHLRmkqpmKUdtTNUUpVdMEixFk4oCIto=
X-Gm-Gg: AZFdTZdQ22u8PYLgf+9+TXjg1WUkWZIvLJo3+ICegFdPE58HNdCWYpX9TRMmoHUpM0b
	U0iBn8br0YVCbIlXxRoOONRx3g/QBarqURtVQcdALu+sKYwienVW+pI8nIWLw7Skk7ym70m4noR
	gwkrTLVYamoq3rintNHfixTLon9xthT2IyKFzyY4t5sN6Ii7hMIGVl7a7Sb3degU+ZLqs1NDUwc
	loC6ibH2xc7yaSzWClMbm92qExzgZVg0wqaBt8At75Aw/QGxhKux72hvKpOQMJyNulX0HYBAGKe
	UD/onoGxpfFzYGdNiRCmRIrBxv6ECLYzAnuts9RhrIjnCdAIPIx2l0rJ8dk+wvaoAxBBf8BeV40
	YH1hXwOuKLkIIJICXX57tvGAxsRII2fIDKurpweJb5G6QKWGYfy6QfZilgWS9YE9voDeIrgNhoB
	yWTqoLJujZEmZ1jawkz4ti5PDW8zWjumDHYtUwuKNSNG76GjQ6DiwCoIhXMRJTgMmZKUIja4C50
	Ojb1hjcEOoLummx2v34n8TL+SO859OhS9QlOsuwGcUkPg6QN9Wk8PLt18NmsxpEKSeq1nKsvF7P
	omU8TlP/E1kZ7kvDwe5/S5d3yh8dbOW7NYFcz94U5dc4YZfoUFd1DEFCdygtMV9BKpy27NNikDS
	MijyW9fUGAk3TG/vrpVmsZw70Y6mYMiypWkmD
X-Received: by 2002:a05:6870:41d4:b0:4ad:852b:333 with SMTP id 586e51a60fabf-4bc8307d56fmr25048990fac.50.1795832184572;
        Fri, 27 Nov 2026 18:16:24 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5a::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61081159sm22936697fac.15.2026.11.27.18.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 18:16:23 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 03:16:21 +0100
Message-Id: <DN6HDN2N87GO.C2NVM588C2DP@gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] x86/mm: Resolve BPF exception fixups
 for user address faults under SMAP
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1795829324.git.memxor@gmail.com>
 <0a30eeab6bea7ddfc0202d1970ab1b7f3a4d580c.1795829324.git.memxor@gmail.com>
 <sashiko-outbox-238412@kernel.org>
In-Reply-To: <sashiko-outbox-238412@kernel.org>

On Sat Nov 28, 2026 at 2:46 AM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] x86/mm: SMAP does not fault on supervisor mappings below
>   TASK_SIZE_MAX
> --
>
> commit 9b387754d627ac256ae9705ce7d6a4e7a2935051
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> x86/mm: Resolve BPF exception fixups for user address faults under SMAP
>
> This commit resolves EX_TYPE_BPF exception table entries on kernel-mode r=
ead
> faults in do_user_addr_fault() under SMAP, allowing the x86 BPF JIT to om=
it
> its software range check before PROBE_MEM loads.
>
>> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
>> index aa88370ce7394..9fe8705eff043 100644
>> --- a/arch/x86/mm/fault.c
>> +++ b/arch/x86/mm/fault.c
>> @@ -1263,7 +1263,16 @@ void do_user_addr_fault(struct pt_regs *regs,
>>  		     !(error_code & X86_PF_USER) &&
>>  		     !(regs->flags & X86_EFLAGS_AC))) {
>>  		/*
>> -		 * No extable entry here.  This was a kernel access to an
>> +		 * The CPU refused the access. If the BPF JIT marked this load
>> +		 * as one that may fault, skip it and zero the destination.
>> +		 */
>> +		if (!user_mode(regs) && !(error_code & X86_PF_WRITE) &&
>> +		    ex_get_fixup_type(regs->ip) =3D=3D EX_TYPE_BPF &&
>> +		    fixup_exception(regs, X86_TRAP_PF, error_code, address))
>> +			return;
>
> [Severity: Medium]
> Can relying on SMAP to refuse PROBE_MEM loads below TASK_SIZE_MAX allow r=
eads
> from supervisor mappings in the low address range when a temporary mm suc=
h as
> efi_mm is active in CR3?
>

Which is fine, the read just goes through in that case. Bot is confused abo=
ut
the semantics of the feature.

> [...]
