Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D21292B54
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 01:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780362354; cv=none; b=cQuVLDzqCrk/Tafrl9vHuZeeqnSdx7aB1nyMz7uEzrm8YQLdlmHRfXZWBvKwq0K8aoA0mlnrhr6MiMrOxTN/kyG/EuwHgIK0a1KCgWlrRWygOcbiyK+EDLQlWnqQEbuTPRJ+S8QsQBdo8E/k19MpUagrKhcLUgkHAaWoDpLuXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780362354; c=relaxed/simple;
	bh=59TfrDg3AN365Ujwbp2F9cMhnyY6ii7H2FTMzyuOqto=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JXN8+VZfxjWZBeWKBcSqmfjMv9rqi8Ymix6ITRT0Ue+rDKQ0JsgYOnP2BbN2d/MlDGbU9Sbq2yjO2Ux6id0bv/qZGNUuyObRcIp+Hay6vmXA3gjMRaU8c6Ty1mDRXpFHTL8AzamRo3ryNAZ61qWIYR+SGszCHNHRB/3ETA0ENik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=x3jsV45k; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="x3jsV45k"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304fb780deaso3075829eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 18:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780362353; x=1780967153; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD1cZTsu+RVWHSjlzzbSvu5XwRwT1lM8xmnMKme2HqY=;
        b=x3jsV45kH4Rd1E/hL99a6T42mTIai6oba5qjLvYp7UqyOtIKpQkPX91eJpB2T2ERdr
         tZDoEEtAgVdAi5IvWhSUg7onpGGXMCrlyQ4adwxybmVCGkp9DWZ5fvh7vNFcJwc+OiDp
         ybBOcAso7gOiGuOCOtMyxORbJibF9JzKyJOCzDvUX/F6OwhtGP/WaZ8aCulNq1dl0E6d
         4ea7XA5D1jGJ+THD5O7lbM9kTJnFvLz72V0zpRZNubSHxxVtzHXQi7QEX/9iFx+mqtKD
         4dgOX+Ash6Hocbhts3bSa1FWEi6LooDekGr7dCGvrq3PkjxAemO+ASQT7wnIH3Y31/CG
         OTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780362353; x=1780967153;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD1cZTsu+RVWHSjlzzbSvu5XwRwT1lM8xmnMKme2HqY=;
        b=FVewowloOftg7wzEHPWfxbF059pVPN7sch4oHe5y4avImv9THqPRWpGSCCzuLT+gtm
         HoH6lt5uTfFyKeBIKR6zZUY+IyNp8Uo9ZF0kNpwSJ5Y/B2MTb13bb17wsvlE6ub2Bucw
         CpBQ27rF7yCCrFfXdB+o231mw1xtz0NqQfaGb3uHs4icXCpj4GeuVJUldq15Tnbv+mek
         9IfSLo1+Vxdf1axpu4ZWkY3wyfoLpSYUiLwKCP79/lkvOYvTp0eu18nJPjc0+80HcC8r
         boqLkAoB59CmcnmhoqudKYUsXMcX6xoHXb0U6eeUWc2Bwmvcu27lxKR37cBWwOqOhIMx
         6p2g==
X-Gm-Message-State: AOJu0YwWPjPF3Yl9Lp2pYdRrcQBtVxZEqAMNFaaAupVWdn9zR6Mo4imi
	5s12WK80xLMB8KD+xoQ6LFR8N2jjclb8PUwFzCHUMI0rftFXhVn5ZjMYu8urG672ZhEQL3/ESVi
	clb373EIeKyqI
X-Gm-Gg: Acq92OHYhhuzkh60XROL9o9jH9lvwNf4xRmTUA81EEpTjCtijSkF5uiQTtbk5ZrZwDm
	jH3cHKZbsM2rsBrzHJ4gZOwS6ZW1/i0zb26cAPV56F3IK66wU7Z2hweQLbb8WUv2JHY23GzKuaq
	xNoxzt0Lp4YyO+EEuibx59RkPEW80yOhkHezNNDpHidaN5uBSSMEaMzyJAGfPh8bskUc53P8Vwt
	gtYRfqDbOR6IwHB47wY7YasnIn/eGn1VxHiZhSp7CFzSkhIl9gIBmK+U/0xVAvTHm0bz0rfyHxx
	ZrswGFtVU8e9jaW3PVTZPRFUrEnLw3y/nP0hegSc1yUpr+/AiVPnNNP2pRRZrDUt+3CG7vdFFEK
	X3d+7wgECis+xh2rqbMg2ZvsMun/DGhQtfdjanbFYWVSbIfK+6GqLyakaiRvqyQjtj7Qf2CzkRq
	vz/GlTSDW6gsdOzxU=
X-Received: by 2002:a05:7300:6427:b0:2ed:e12:376d with SMTP id 5a478bee46e88-304fa6dcc72mr6499745eec.35.1780362352751;
        Mon, 01 Jun 2026 18:05:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::4f12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ee0dd6fdsm9635690eec.23.2026.06.01.18.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 18:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 21:05:50 -0400
Message-Id: <DIY5S4WHJ4ED.12QHS2OXCURJE@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 2/6] verifier: parse BTF type tags for
 function arguments
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602004120.17087-3-emil@etsalapatis.com>
 <20260602010506.F2F3B1F00893@smtp.kernel.org>
In-Reply-To: <20260602010506.F2F3B1F00893@smtp.kernel.org>

On Mon Jun 1, 2026 at 9:05 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The `btf_scan_type_tags` function unconditionally rejects an=
y `type_tag` other than "arena", breaking previously valid BPF programs.
> --
>
> commit 1b7f5032b014c339265f4b7f34961a16eb4c5894
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> verifier: parse BTF type tags for function arguments
>
> The BTF parsing logic for function arguments goes through
> the arguments' decl tags, but does not go into their type
> tags. Add type tag parsing for function arguments.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index 17d4ab0a82068..c6a930aca67ec 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
>> +static int btf_scan_type_tags(struct bpf_verifier_env *env,
>> +			      const struct btf *btf, u32 type_id,
>> +			      u32 *tags)
>> +{
>> +	const struct btf_type *t;
>> +
>> +	/* Find the first pointer type in the chain. */
>> +	t =3D btf_type_skip_modifiers(btf, type_id, NULL);
>> +	if (!t || !btf_type_is_ptr(t))
>> +		return 0;
>> +
>> +	/* We got a pointer, get all associated type tags. */
>> +	t =3D btf_type_by_id(btf, t->type);
>> +	while (t && btf_type_is_type_tag(t)) {
>> +		const char *tag =3D __btf_name_by_offset(btf, t->name_off);
>> +
>> +		if (strcmp(tag, "arena") =3D=3D 0) {
>> +			*tags |=3D ARG_TAG_ARENA;
>> +		} else {
>> +			bpf_log(&env->log, "function signature member has unsupported type t=
ag '%s'\n",
>> +				tag);
>> +			return -EOPNOTSUPP;
>> +		}
>
> [Severity: Critical]
> Will this unconditionally reject any type tags other than "arena", causin=
g
> previously valid BPF programs to fail verification?
>
> Since tags like "user", "rcu", or "percpu" are commonly used in kernel
> headers, and were previously skipped by btf_type_skip_modifiers(), return=
ing
> -EOPNOTSUPP here will propagate through btf_prepare_func_args() and abort
> loading global subprograms that use these type tags.
>
> Could this break backward compatibility for existing userspace programs?


Already addressed in previous round.
>
>> +
>> +		t =3D btf_type_by_id(btf, t->type);
>> +	}
>> +
>> +	return 0;
>> +}

