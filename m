Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352D35201C
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780782468; cv=none; b=Nbcw49UbLv7OfwqtF0fMdlbOzJgBJT89kXLwEUjnfbFi91kwcDuyRjl1nJceagWO8sIRIUltRKzuJTGIKa4bk5pTLBKGnLTDvd+FhnZrM6k/jKQdjMLvdGdolpDOOyAxnWw2C/F4wB3HrDTAYPU3A6zeqOhVzTTiRFrvnMIYciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780782468; c=relaxed/simple;
	bh=VGNia2i+xsmFO//wEAhSljOQ0OTS6fqEcGSMHk++chw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n4APJHalX1Po1AzQg0EmjqgQ3/8W4kCFvLDCJrEpOORgYGnwclJEsmOxTuMJrpQ7rWDqZ3B6fMSDrbDz68QYROnnaA/k7gjWmrEF31fxykgjAuICpgFuDKblu1SEGT7i4QIB20kVPv+K3K2+YY2YErKsgMIsHOAfoGHCjv0QpT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuL1Uans; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuL1Uans"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3045c195251so2758498eec.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 06 Jun 2026 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780782466; x=1781387266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=knAhyW+pB04RzwII1PEi8/COayGb1Z7ctOCyHMJc4zo=;
        b=GuL1UanswPeV0lfwoD3nol3TxXMt4JNa5MdIfCSzJf2e9/jvGf7PTOqXbC7QVU/OJr
         TegcYfNyziLPZdHc5NwWSiNVTLH1FSssrvgLWr1g4gAUOu9OjjbPYEwi4A3vf/hc3CBl
         sLjcdHoZwax6f25TTZvLwsP975+B/IGWwtoA9JuG1IEkuhr+C2/TTjOSJnT9u427m5+6
         NTwZwejorKVV9ld90z0P+SavT2xMrb1kMq+myYCh9HRA9dY1UD0SfYPnyAg9ElzO6EUq
         sl3mc2A26lfgdrOlwwZaUov4N+CppJYUEhcMb0BDADF9Fl4V2f5Uuvh2TLholwlvkkYX
         aNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780782466; x=1781387266;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knAhyW+pB04RzwII1PEi8/COayGb1Z7ctOCyHMJc4zo=;
        b=JmG6GejKh/cH01Lkk5ovFdrFKH515khMoDvY8stGdrL/dKo58CcVSoRtA8sNKveioS
         FVwkLVx1P2YiUT1M7BLyr4XDxwqG0Hf8vjfTb514ZDDrMp1KhbXrTTZADGQk6s91bFfA
         Y/rzbxstDAhQtBql3Z47Jba3yppXRHyRJkHFuEfs1YaavzCXuO5to/7WyapfxNKCSm0s
         l3/abagvqUR7gHmqF4eMAS6h72bb4X0J6rD/HWfCzC/bB1xjm7OD3N5wjssRkUYO6PSP
         bHNmwDilbz+HCmHhUEZ5m8L/ZBcKEWfIQRqhTTOZY6FhlYgDRYNB3DVzmqxadGKcRRxA
         RUMA==
X-Gm-Message-State: AOJu0YwQm2YAGw6scHgZukos5sDySJ+g16hunqssErtztDeJLBUUrBm/
	JJ6seDKzlWqj1zL5/HwV8N2jVN+OGDPcC/H0YPn1We+TgH/VY7vDEnmM9ZAVrQ==
X-Gm-Gg: Acq92OEMkAkXZfu3wGi5QRn0y84AHq9bLXx49Ae4V3Ih7xtneOj7ZE0EP9kLF1SuiVX
	ec7sH2hTfhoHRIjH7JPkfRzydDebryRI3zkxuCps9mAfu1j4wKlPDEklG2xxYcU7O1fWl/D8zaI
	iCepHkl65ctF/vVMQA2J2sVFwdf4nU1wkPkn7pM7F99yTy0G83pSf0q13KGKbg4rPz5gVWY2d7H
	GccXd5gpLGsjtyqAEO7zXxnPeHRu33gMSVknNTPd8gCLlCGgvnL9MYa81e1qxYbe8lFFEBMnJlT
	HJPSK2YNZVZroR8luY8m44Me/jDHNuBfdTM4a6ppaWrYuYcd2SO9+UlI62iF/BzriYBocWF05Pz
	Q0NO/r25msZkbMFkYMKgxD+D7vrOkq5A9F/1pJgZxCJ8QXw9fhJh3kYq1+AYLQMFHL8cH0Jr+TC
	kJoHP08meYpc04PAab/yF4xJvKwA1cJ7PF/kFjzdy00f0cZXNEg10=
X-Received: by 2002:a05:7300:ca4:b0:304:885f:2db0 with SMTP id 5a478bee46e88-3077b22a7demr5774015eec.20.1780782465662;
        Sat, 06 Jun 2026 14:47:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:b36f:a793:65eb:7bcd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm8887001c88.6.2026.06.06.14.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 14:47:45 -0700 (PDT)
Date: Sat, 06 Jun 2026 18:47:40 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: linux-perf-users@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/7=5D_perf_stat=3A_Introduce_perf=5Fen?=
 =?US-ASCII?Q?v=5F=5Fget=5Fcpu=5Ftopology=28=29_to_guard_NULL_env-=3Ecpu?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260606202336.0F9321F00893@smtp.kernel.org>
References: <20260606200601.1861227-3-acme@kernel.org> <20260606202336.0F9321F00893@smtp.kernel.org>
Message-ID: <4E25032E-8AD5-4832-B776-0B2E22E5B827@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 6, 2026 5:23:35 PM GMT-03:00, sashiko-bot@kernel=2Eorg wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
>Pre-existing issues:
>- [High] Missing bounds validation for the untrusted `sample->cpu` index =
when accessing the dynamically allocated `env->cpu` array in `machine__reso=
lve()`=2E



One more series that has small patches and no issues from local and public=
 dashiki, only detecting (more) preexisting issues, all noted and being qui=
ckly addressed in follow up series=2E

Waiting a bit more for possible human reviews to them merge it and submit =
the next, that's already in the works :-)

Best regards,=20

- Arnaldo=20

>--
>
>commit 50d04a9b8194c04adf66854548c5855bbd4c23f4
>Author: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>
>
>perf stat: Introduce perf_env__get_cpu_topology() to guard NULL env->cpu
>
>This commit introduces a safe accessor, perf_env__get_cpu_topology(), to
>prevent NULL pointer dereferences when accessing env->cpu on older
>perf=2Edata files=2E It also updates several topology aggregation callbac=
ks
>in builtin-stat=2Ec to use this new accessor=2E
>
>> diff --git a/tools/perf/util/env=2Eh b/tools/perf/util/env=2Eh
>> index 7621d1f73b83a=2E=2E7acca39b42ff3 100644
>> --- a/tools/perf/util/env=2Eh
>> +++ b/tools/perf/util/env=2Eh
>
>[ =2E=2E=2E ]
>
>> @@ -187,6 +187,20 @@ const char *perf_env__pmu_mappings(struct perf_env=
 *env);
>> =20
>>  int perf_env__read_cpu_topology_map(struct perf_env *env);
>> =20
>> +/*
>> + * Safe accessor for env->cpu[] topology array=2E  env->cpu can be NUL=
L when
>> + * reading old-format perf=2Edata that predates topology information =
=E2=80=94
>> + * process_cpu_topology() in header=2Ec frees it while nr_cpus_avail r=
emains
>> + * set, so callers must not index env->cpu[] without this check=2E
>> + */
>> +static inline struct cpu_topology_map *
>> +perf_env__get_cpu_topology(struct perf_env *env, struct perf_cpu cpu)
>> +{
>> +	if (env->cpu && cpu=2Ecpu >=3D 0 && cpu=2Ecpu < env->nr_cpus_avail)
>> +		return &env->cpu[cpu=2Ecpu];
>> +	return NULL;
>> +}
>
>[Severity: High]
>This is a pre-existing issue, but I noticed that tools/perf/util/event=2E=
c
>accesses the dynamically allocated env->cpu array without validation=2E
>
>In machine__resolve():
>
>	if (al->cpu >=3D 0) {
>		struct perf_env *env =3D machine->env;
>
>		if (env && env->cpu)
>			al->socket =3D env->cpu[al->cpu]=2Esocket_id;
>	}
>
>Since al->cpu is derived from the untrusted perf=2Edata file payload,
>can this trigger an out-of-bounds heap read on env->cpu[] if the
>file provides an artificially large CPU index?
>
>Would it make sense to update machine__resolve() to use this new
>perf_env__get_cpu_topology() helper to ensure proper validation against
>env->nr_cpus_avail?
>

- Arnaldo 
