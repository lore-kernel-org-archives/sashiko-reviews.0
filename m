Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865A258EC1
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290198; cv=none; b=QMeosMXs5fdvvaWj2Yq8KNapSOrXPpsGwTfUjics1R77lnOYTlINjw1ZbwhnT0ua9Jk2hq6jMEmXmTvBzfZI89BkAY9LUCiBH9ou76em8RU7Q3uriOW9ARvAkZ5FhvjXV6Kk57J7226ovnd/7ejjMqg39cZLb/Nf+5Kdv/ofRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290198; c=relaxed/simple;
	bh=2+uyhBQagbfG5ZCWG5OKDBtrcFUr3emz6OXagiQU61s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a8/dlnEkDb4DdCGeIYlbVAT3zfVL3Mp3Yvxfb17F3iTQ1nkeYeMiFlyuedYgIrN90neKDOrSXIkpXGqnVj96rznpzJlqN5vFHoxU124e/2zryZk5Oo5XFi5taL9R1LFcL14lTriew+6ThoHL2bV2UuxwV0zKdOgEnSgWbkeSUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=czKSbQji; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="czKSbQji"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b8d414666so2240740a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 22:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780290196; x=1780894996; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Sz5ZtK6XA9gIDZiiscXeLXvS4nQonpQUUo02wHj6Ok=;
        b=czKSbQjir9FNyLM/lQr5xdUDHvDPAoZHiO2HC24ABGA1SHWUrZBKG07hsGTL4j0DVy
         Wo1ppFeKU7loTUCIqnR14fAGKdxymhSnQ00Exl/nkGTBdC7QP0COJA8cunoxLHKS9MoK
         AIqXn1V78ZhcQREhryEGLFf+y8Cz+ab9PfT1pLqI1RQVX9OQtyTEoVSZmGn1Y4jy+7rX
         K2tBKtL6cSAC6mBGyhRZwfQ0FGJomAs3Gjoc/SQWG6MNZP9KTX7OfGig5bymihlKlgdV
         qPsuLlrD4doELEuBQsiH3NxH6DQykE5IpXkM7pRkrPIbZBKsmfysdWa77JvWKNowH7hx
         VqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780290196; x=1780894996;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Sz5ZtK6XA9gIDZiiscXeLXvS4nQonpQUUo02wHj6Ok=;
        b=T46M7QaFZMgSNUYIcpJyjFX/pMmSLS9ciNlUCUSf1i7YNl3HetL0NHC/zaipE46FZc
         YnOIS7ltlDrxeQRUsZuojoVzHi4Ghd+WeV/p54j/91lcfFEztZh6T6b1UVqaVJm3gFZT
         ASDy4D+BXnf6yyscKkaXwp12iB4isdhkT0pUthKFaUTlLiopD/nBEIMTXAIc3TbH5YtI
         wvf3lmSY1BK/ud5OlHtncC8BDircNyn55Pw66QxEy1OB38rVhORnYuX+b6jo4PFt1KPJ
         ktdLWbyMjSUn20QDKEwa8AQUJ+jmDj41tAvJLUsfuSLBdcZ84zNuahKy54d6oWgMjJCB
         EJvg==
X-Forwarded-Encrypted: i=1; AFNElJ8/1RvkMnMBbzzTkLrL4azzAyf5OxFEuNhbeIs4laUhFuNNxghqN3N2MH2hWBYyfu4GwOR24fzcMFIk/17wTA4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKctrVhyTTRD9QFLITrNCAao8jpJb3neFjNacHoxqVvqbf/ysG
	D3i1EMDXYHHIKHjep/llQqMsfkBjPahlN/PA90+RYCcY8IDZftGHontfmkqFimwKygg=
X-Gm-Gg: Acq92OEb3OWy11Cgy/6IdiJSoYpv3CwNqONMbPGo9BgoE9vhrUkUjWcen/fjakBUXKq
	++ZQdY3g4NwL7nlVFRxN9TqA1l9M/6/jXp3XHXb8aqoU1BiMAv42E10VejPPIqXWn+YjrtnCvUQ
	gwTdRehTxfDPBt2WFf20Wl5uVLaUdGqJl9/Ei4bQ250yZRJmRVBaCm586AhkJv9emS8fnFihdwU
	Md6GjxzpWJV9tHDe7F1fMX0sjDi6ps4BXyhE4qsUywUw8gkue4xSEM82nDtym855kgp8+Z3n2Hk
	rKB0XNw6IizcEs/Zl/al0ZpBgm8cvq5cGJdnv840PGiKFjJjBRkRWC40MLFyMDnNltwXv6UpJMv
	n+gfym6ncztUYLk7ELgnZQuHAHBbsXkMefPSwEXPoF/NOPLcKEgqEgFIi4YH01ZNGAeoV++mAzX
	QGi4J5BdNB8Wqb5w5/daAlkD2ACZyAtfaisdA=
X-Received: by 2002:a17:90b:5289:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-36c4ff25c56mr8168205a91.4.1780290195983;
        Sun, 31 May 2026 22:03:15 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcf4773sm4250439a91.5.2026.05.31.22.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 01:03:14 -0400
Message-Id: <DIXG7CV6I2RL.2D0BT0TKB2ZM9@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 4/5] selftests/bpf: Remove __arg_arena from
 the codebase
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530002259.4505-5-emil@etsalapatis.com>
 <20260530050310.113761F00893@smtp.kernel.org>
 <DIWLWEKAUX29.3HJP2JO064JLR@gmail.com>
In-Reply-To: <DIWLWEKAUX29.3HJP2JO064JLR@gmail.com>

On Sun May 31, 2026 at 1:18 AM EDT, Alexei Starovoitov wrote:
> On Fri May 29, 2026 at 10:03 PM PDT, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [Low] Incomplete removal of `__arg_arena` annotation
>> --
>>
>> commit 936642e9509313ae2959c6a3c4255651cca7040f
>> Author: Emil Tsalapatis <emil@etsalapatis.com>
>>
>> selftests/bpf: Remove __arg_arena from the codebase
>>
>> This commit removes the __arg_arena annotation from the codebase because
>> it has been subsumed by the __arena BTF type tag. The typedefs previousl=
y
>> used to minimize __arena annotations are removed, and the pointer types
>> are directly annotated when declaring variables instead.
>>
>>> diff --git a/tools/testing/selftests/bpf/bpf_arena_htab.h b/tools/testi=
ng/selftests/bpf/bpf_arena_htab.h
>>> index acc01a876668e..eb80d67c38708 100644
>>> --- a/tools/testing/selftests/bpf/bpf_arena_htab.h
>>> +++ b/tools/testing/selftests/bpf/bpf_arena_htab.h
>>
>> [ ... ]
>>
>>> @@ -53,7 +52,7 @@ static int htab_hash(int key)
>>>  	return key;
>>>  }
>>> =20
>>> -__weak int htab_lookup_elem(htab_t *htab __arg_arena, int key)
>>> +__weak int htab_lookup_elem(struct htab __arena *htab __arg_arena, int=
 key)
>>
>> [Severity: Low]
>> Is the __arg_arena annotation incorrectly retained here? The commit
>> message mentions removing __arg_arena from the codebase, but it seems to
>> still be present in the signature of htab_lookup_elem().
>
> Spotted this manually as well.

Valid issue, this use was originally left in because arena_htab has a
selftests for FORCE_ASM mode that turns the __arena into a no-op. I will
make sure __arena retains the type tag even with that option on, which
should make the test pass.
