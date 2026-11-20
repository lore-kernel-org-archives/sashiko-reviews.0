Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197051;
	b=z80HqADJvt+YFH1nBN3IDrjxqj68L+Sy8AtDBtYMXt5zhf3xlcho8HH68hS8MUhk4+V0
	 SLteuS+/chRrcXpOZom/DOqBJ1ngxGmdFdib1LNumqf2KblhHy6/GDwwcAVZ1YQpiy4kM
	 6pAFojlPmzFrfTh5ooFqkvFBCc/VomJdsZONniRwXPX+seveqUq8hq8iqfVI6AzBnzIvE
	 9YOXIvimGJfe864628ayy8SJKqsrI+JIK3KXNthFhOmkn9AhXdIoM5bj9amc1wLlZBG1t
	 JvD8lvLOHve6RxlsUrSGQaF3sleWv2c2JASXtNLtbc0UkPgUCvC90Ie4glkGX/HNJGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/ckA76GFethZlS9qiSTr1nMW1OVkHUs1BNcHEyirqeU=;
	b=0EMNDl5WwBHRF+P3rY+Rg4tKAzpV6Bh1EnWlniMqeqCKOwrpSFFWJXuVDC6sO6pHoquU
	 33rf6TuQOTvU6D7CHwfkCWvFignNOBluN1YLaiHkXzH9SmME5RLCKs4/7pejivF8yGTk6
	 AB0ueAwbYXimD/U1R0pG/g6/n5d6RPJsXS5l9K2BbpTQ2tgI5g1lgtPIFSzLbg3N9z2sp
	 iC3mhW+LcctrzrPCe5zjpDuj8TVAyu41LzxTz8/+gb1Zuv7nJU58pgmK9iKCSIaL/osC/
	 3st0JEUFLnlP7GCeFUD+sp/bvS8hyI3fVbgL5CW1pBR2WDpcmx/jkIR5w9LIDO5fE+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN7X9VJR;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097A606A33E
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 17:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8097A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JN7X9VJR
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b439e37813so355041a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 09:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197049; x=1795801849; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ckA76GFethZlS9qiSTr1nMW1OVkHUs1BNcHEyirqeU=;
        b=JN7X9VJRJj+ORvm62As8Mm7+TuXtI8313qVZWjP4mz+xJRY5HDtHeGPA7H/4gBx6gM
         IA9YszxsffmzPHx5KQJE+Q1R654slj50kSQVBLcGa644k3QfbtwAOr1RfPKVHW0zdDK+
         K9ANhcV7xNEW6FtYkFvCk75/EswTzBPFz2VGvwQlLXSwn/zoqrkmTLqQasy5Cd5KT/IB
         MLUWKv9sGQp1mmJ8AY+WhyI04M6eHGQAqZP0BHOo3B91FIPqq/04B5bu6ilDPNIcEoD4
         1gv+LDG5NHAllZA8a3+itz9yavNVIbO1HAlwO+fJL1Vm0JPDC+Tjt1kwecm12A22YAjS
         pF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197049; x=1795801849;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ckA76GFethZlS9qiSTr1nMW1OVkHUs1BNcHEyirqeU=;
        b=1DMC2W6Rx4xOVrZHZpDPw/2mgTzqpsguwxGfgPJg1fHIth58UpwqDicho56cPD9ni0
         OBXZI9tlHVsT59zZHgzOFLCmEVtDnCqF8Keno8E1czxUFOtXzNdNdYD0vGhx3S0N96jd
         DXYxqrVUNAC1gxIrAsWqoDwqZsWfC974laZnB/N7wWf8Vpeie2Ut7b6/CIn0Kwchyb+N
         siZ4htA42az4xc0NnFW+G7RDEsVtxIfc7u17JPnbTopMts1r/ia+57SeX/lR4UUAgiY9
         Dsn7jTl5yM8+b+oDshJV5iFu6lU7arF9lhPEpmg5bhdjIHI8OmQ7pHAwsXKiOWCsSfSM
         PCQg==
X-Gm-Message-State: APuU4Z+rERIrPzl4ujGNvRTtAYJFmfgSAer6bYNh5Eqg/DIMWh3u9h1y
	mSL/oRm7VkLPUd/b0+9GemALyfNlkhJotOM9UAwGDSoV46kwSVWcUr+g5n+JDA==
X-Gm-Gg: AZFdTZf+hXa/gU3bwk2nkOnZjiUEW9LyohOL6JJrf0m82uece+Je2MNNI9j0pKD/nDy
	UUdPtLmgyFaKF5daIpqfT8zhypIJSXCCTI38zYKu4pM/Ws5PIh2NVjoACoKRACrxFeIfWvOrOVG
	xMo5ipi6ihOLShSqtTRdoJ9hVUO9fI2i5zhuIFTAMApFMb5j8hBbg0o3UcxEkfQ2HtwXoCLW5VE
	gDy6nJCRoOi5EReaALPOMUgSD8Eq0dKcP0kYYjC5LOcL+Qk4BKH+hMI5KjzUrSfqiWhYkvUldHg
	PlNhkue7vtleFCKVBpmbTEmHjZETEG7HUF9aOjJzKP439B8tg5S92pxT7ETk3OgEetsIFYAtfAt
	ulZLffR7FJjqFXZijzXNZM4D9pa2UBPvFqk6bXO3PIQx28icHmeO2GZXqmirlLdfOjVmBudRZwI
	K58oAGSWJE/HdXdz+y9lQV+mqi2Q8ncVTDQR+pBY2cgfVJVPDqFXs+Qi3Bq5O2089rlXn1+0fHn
	2w2ZKiGm5qhR+jKDURu7xHCTspZ7atAccv2BWBq1j7yo90WU7P7PI1f/apQsZx3vwMdO9gBnfcm
	kzmCJsiw0l3X2dYrk5SW1bxtAmB15GkjtF1HguOZOgOoYoaFq/YWXWA6s8KcE+oFDRUmCOBG5VH
	uSfvpQtiW6BZHzPfulbgLHPR4gV7u5D0plQ==
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr3371920a91.14.1795197048356;
        Fri, 20 Nov 2026 09:50:48 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm7924274a91.7.2026.11.20.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:50:47 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 17:50:47 +0000
Message-Id: <DN088QK5C3RO.26A4S236XCPSF@gmail.com>
Subject: Re: [PATCH bpf-next 05/49] bpf: Limit the cost and the memory of a
 load
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-224673@kernel.org>
References: <20261120074430.2704488-1-alexei.starovoitov@gmail.com> <20261120074430.2704488-6-alexei.starovoitov@gmail.com> <sashiko-outbox-224673@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 12:00 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> @@ -22013,7 +22035,7 @@ static void free_states(struct bpf_verifier_env *env)
>>  {
>>  	struct bpf_verifier_stack_elem *elem;
>>
>> -	bpf_free_verifier_state(env->cur_state, true);
>> +	bpf_free_verifier_state(env, env->cur_state, true);
>>  	env->cur_state = NULL;
>>  	while ((elem = env->head)) {
>>  		env->head = elem->next;
>
> [Severity: High]
> Does the second bpf_free_verifier_state() call in free_states() also need
> env passed as its first argument?  Leaving it at two arguments breaks the
> build until commit "bpf: Put a barrier where no mask fits" replaces the
> loop later in the series:

It's already explained in the cover letter.
The kernel does not build after patches 3 .. 36.
Each line of code changes in one patch only. Patch 11 moves this loop
to free_pushed_states() and adds env there.
