Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A52270540
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 23:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784329283; cv=pass; b=cbQzlXWP9qobVWOzPx8L6Efj4fUieq/aiNaFYwktBZoUBqb41FkJ2gZeuhi2lJ5r8ol1yU9IzQ+ZnSnFaCKb0E63vXjutw5EHsTaeZWxzEYI30dDJ/X0m3wM0ZohPGnj7Z1T/bEmEnnCdhkjkFlWjb/LrO7YnZLG0NjmEi08W5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784329283; c=relaxed/simple;
	bh=2ARRpIxjwT9FQVCKr+NXXIX57kU8jVAej/m5ibpnIxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmXF7hlW3sQPWMnUWqdE3iX4bnB9Wv7tSao21O06iAHk3fGi5NhxU/ia00CvT+3NUPtE1mnElQsYsOMyC46FpsQ7wvjbWRHz9Y0WQIgu9DaLyxjK16xgPwWB1BL2CSBHnI4uZ38J3YzHSQIJqi85XvoJ++tOgMatnZvleT6JPd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gahCL/e2; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gahCL/e2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15dd4b9132so1287570066b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 16:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784329280; cv=none;
        d=google.com; s=arc-20260327;
        b=NcESyqURaNkgK4XVzi7fAczFOFPnanIrWpZ/pMioi2JQdJe6IXysuXJi0mBg/w2e6A
         f4jOhOGyJ6ER/pAzWXVpvbjKY7zLtF9JI9Hf3sGI5BHVk9LZnR9zw8Rtz1QjJ4JRcvh/
         VcOejJpl3J90vuoqd+iH0Lf1c4pA9DNyjr6/SHB2/wbtCYLP/F7XlBJPmejeRH+evU63
         2LDfAR0BLhqIHjOlvSCRJEokC4vh3/fjJFRh1tsPqtOkHHD6sRCoGidwwK1svw/pwINy
         ymL7Kpa7LLWMjhpyh5D5LF55CA0HjKApeEB1zyWG9+p3VaiDvXTGN06xXzuNRhywS074
         XKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ARRpIxjwT9FQVCKr+NXXIX57kU8jVAej/m5ibpnIxU=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=fn5m1Ue4t0Ymh8OtxAhcDKN6/3yTNZmhNGuzMKpC/MVWVdEXL3l2w9h92xRtaL+yU1
         8VJxxACa7iKt/3/CFRuHVENBjqUnI2O7gVzmEXBcgp62uG4jMlBmQwU5Vxy0rbOISrji
         JAt6Jw9BrZOwyU0UVjdgYV9YyDi84LKJJE8sJBSbZmp2KEKnUE0PPxOk6+4ertmJ9BOL
         gOWS+YIzE4HYOZnnpYCq5FXGsCxXEsgsGVj4jhUi0C0AhsgAsRlFN32ivBxpon1HOZnJ
         wSEsEU+fxwYd+sahsDTYbFvHMX1mKVaHEz/bDTUeO8mRzKx0j1sUddRdFjFuJKTlVjuc
         APJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784329280; x=1784934080; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ARRpIxjwT9FQVCKr+NXXIX57kU8jVAej/m5ibpnIxU=;
        b=gahCL/e2d4YwbtQ+USdPG4820C7UbD039n+PZ8Y5/gmkBtY9EpLoz8M5uQqZ/qoOK7
         15nkSlvSx/TEMsn0q7Z5hRXsUo8FH9toxXxP5FI7y+sEPAcc76Zd5O7L2+b70/j4tTfu
         ZYfIl4LfHcSctbFNz3/hUgjVEMqgO5xeyuOIeJEzPHZYZCOXiuHeVgqu8bdB3mcf/YRQ
         agsVGm1GdMFeNaZarJqmDmPhdKhN0M33vzzTVjvIzIkUGEOfDaSeID0qT5FlDtNRVZZi
         a5YT9ZalOxSXZUXp66KFhyXjx2B+TW8SFEGBjt1zS4gr/UndMfVgIJUXnuqxcVyAKkkF
         3KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784329280; x=1784934080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ARRpIxjwT9FQVCKr+NXXIX57kU8jVAej/m5ibpnIxU=;
        b=iZQec/hnbOFZqNDtJHW6RZ8oqWTAUD7EEzLBlQZCdqD/QY4wGs/znSCRm8wp2ZHZHv
         Hg37blQztt1TcR7Att3z5owpHfnrthP2rWSK6XbcThu+o6HdFEjr8XQdq6tDJzIST+EC
         61UYWkkWHLl0wgI4ecgFYHNEHsn8ayWWTvakROJRh6D84G0BoJfXZ2DPhY8lmQZfUBg2
         VHs0EyfGV4Qg5lIjLnOcF0ZN9buC2CNLonZnOFb6mjaRmzKHSTcvqljTMZp8o+fxUBRs
         /lsvleQ+XVWFWdu/qTD3k+eaZOgKpjKEtRfTBw0jyj/ioCNaeBnp1TN2BHHxUH5E1+Wu
         m3Ig==
X-Gm-Message-State: AOJu0Yw3Mq4Orm5ttqsl4k4p3IvmDmP46PCINFeCXMiN+BXWcVF6PQkw
	e3KicEiBNpgjg1tr3ekVl0+Vr3Cfdiik+6wELOQvsp56qfMmxz0CEqz2o6MKd9xRmjp3KRakS0w
	be9MCjD6rPjkhuLQE31c9hcBvvli54XXjOFr3ksk=
X-Gm-Gg: AfdE7cklzNXlgaZ6saJncioho+SGtcWel+7XL2io8Wm+FWwg0j5FOPiAXXSZ+OqYTfI
	kPXSRVS/t9IRXIx4mUMQlb7qIZ84ESXR8NWbtEwOUTAFIkBQzodXZ2t5MmvHDV0BdDQfmc1bEhc
	B3CJaHZU88LWIThnijz/JKlLXiCR9PulVfEWxoGOsI5j3oe0omGcao8tHpUryTGnBdharVw0cgc
	5XdZ00lLWqge6sQ8P7nHTRdQ7o47a2TPCnk2VSHint6VXSYvDeHVOKTiAfy9t3f
X-Received: by 2002:a17:907:8b91:b0:c15:a487:3482 with SMTP id
 a640c23a62f3a-c16b46a743bmr207455366b.21.1784329280000; Fri, 17 Jul 2026
 16:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717190544.257306-1-main.kalliope@gmail.com>
 <20260717190544.257306-3-main.kalliope@gmail.com> <20260717192714.25C241F000E9@smtp.kernel.org>
In-Reply-To: <20260717192714.25C241F000E9@smtp.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 17 Jul 2026 19:01:08 -0400
X-Gm-Features: AUfX_mySWo6od8t_U_EnSE_TFyGTib92677BpOQma3XswU8Zn8TPXEff4imF5WU
Message-ID: <CAJZwKkgAcZCM104J6qDn-OR39cEGcMy7ECg3xA7yELJq9krAqA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc32 JIT
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2026 at 19:27 UTC, sashiko-bot@kernel.org wrote:
> [High] emit_call_libgcc_ll() swaps the high and low 32-bit words of
> 64-bit arguments when passing them to libgcc helpers.

It does not. I checked this directly with hppa-linux-gcc 14.3.0: for a call
with two u64 arguments, GCC places the first argument's low and high words
in %r26 and %r25, and the second's in %r24 and %r23. A u64 return uses %r28
for the high word and %r29 for the low word. This matches
emit_call_libgcc_ll() and the JIT's existing normal helper-call path.

emit_call_libgcc_ll() is also the existing path for the JIT's 64-bit
multiplication and shifts through the stock libgcc routines. Their test_bpf
cases pass, as do the ALU64 signed div/mod register and immediate-magnitude
cases added here.

> [High] The parisc32 JIT silently miscompiles the BPF_MOVSX (move with
> sign extension) instruction, treating it as a standard move.

Yes, and it is pre-existing and separate from signed div/mod. The JIT
dispatches BPF_{ALU,ALU64} | BPF_MOV | BPF_X without inspecting insn->off,
so a sign-extending move (off = 8/16/32) is emitted as a plain copy. This
patch does not touch the MOV path; the five BPF_MOVSX test_bpf cases fail
identically before and after the series. I'll address it in a separate patch.

Nicholas
