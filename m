Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FBA3CFF4C
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788701686; cv=none; b=fmEZhxPqHVJ2cXHki5KGXqjjv4HEsruQ4yuGMfZ/kw0/+7Q0tEzWAo0itDAJJm2K22PmvEnhL//2l0rUKg/S8MfVMWF2252Fn3x6jkYfj/CMR0aZK1hXYGz+YwOnLdJS/uwC6V+paCBKXkB3rVT3sMkFr82wFxKiiuRHr6skuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788701686; c=relaxed/simple;
	bh=+bYpOxR62ApVfAC6p/8ZfEAUw8ze7EuzOOD0sdUNvFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECrY4oowP+x1ufdlx/ko3Dj2B/KLbHjDkOygz1/ym64ryrWNqOzV2UXI/xZ1i6ur16R2Y+Fd3DsQBUrNxMwRS+ceTJWWUbX88ajXb+CoHo9Km4YDtdyxaB3N7QMfMKN27CFbPE8Vw3blNUEKKwnmJIbQW/nciLwLTy2V3BfYtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZLmZmop; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZLmZmop"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso23169815ad.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788701684; x=1789306484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bYpOxR62ApVfAC6p/8ZfEAUw8ze7EuzOOD0sdUNvFs=;
        b=kZLmZmopTnTNxvUayHZTFp6KKlIkBWvsepcZijBorqDhTn9Qeu6RaoImNKaWVeffNo
         zwRhLlKPZd5THX4K0dxlgCNfXY3FDzg2/zHn/bsG1xtfRJpvlqzLAyjLCwnN+r4cYGew
         GclDDApnQZsoOaGe4p2eKZz7ay8WKLwmh5iBvTIBWqSyFVW9ADO161jMa9NAzYdWWfdM
         FIQJXisVuxjL/kGgTiPNJ7IC6O4nB67SQz0MDWEuEjgbv46OedPz/ubCNT8IjUDJQHBb
         WqqHcUhGN3NzZECPm9M41QdLIN8S2eqFV9i3Tbd1d5K+qzvLHjW9n/np/WgEwttRTp4e
         8DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788701684; x=1789306484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bYpOxR62ApVfAC6p/8ZfEAUw8ze7EuzOOD0sdUNvFs=;
        b=Tori/bb0Qyglf9T/cL7RFxkuCx77jyJb2sjrB1PChqeLcMZDVe7pWO6CdzzzS0ZX3L
         qLM4tuQWcvaotNyjr7UZiXfae0IR+alL48bkbjgWtGs0hg6yCn/oFDM8eaQ9/7xoA5Bd
         8o3d8VTCx/GHOsXtY4A4n+YbzbpZ2O/BMg9BtM5reCZTr1oCrW32gVD5vYrFEV4iXgfw
         GiJlz5mkUNuNLYBE7RfV8dB3XwBa3X4jgldUezV69j+pXDBCjOiP6nLX5eOFlXs23X+z
         CVtZHifxIGBMI8jt2iX+GEZz2FOTmARKoLwaRwyBGYHF5LKKAg0XYi3d1nIDQ0EW5d4v
         T/Yw==
X-Gm-Message-State: AFuF++ngPxt+ViAcUNaf6589lwKDF+TCNYT3EQNIPMZ6gN0AvTKfM89M
	90cLHr54sH8pysVQX9RqaKvM3p3F6XBiJq796PbsAsPUM6UD+3HF0KxJDre7UE7bsw==
X-Gm-Gg: AYBFou394/ERpkacM6r80mXwtmvEhUclKSqHeA+v14zujQ7YXLt5LJuMyjN+IrlY9F3
	6qki53cqFeiw8pxk59IpjJFtlr2gTp39OxvJXMWfuDfM555WZ1CMo+b/tL8J6v0kynyCyDvBM1V
	Gwb7FEOhzyE0EX6/iqFwPYfmXWvYe9lX1UihuPl6rCMSsNw+QSCvtWuf8FhsJxENrxyZOykJTyX
	BixZuLU3a6J4q1yy1UXsgEf+mUUaGoL1Dy/bKA658D0w1son5dywPwFpMWtNM0I6936CWscahMf
	PAsEu1U4fdDB93BSoK7Crknho7ZARL3tTsvxJtEIwI+kmr1dV3gi524lEnsuQVx/EVC+0a+B6nh
	MbDJzlF3NgSrA68kYMFlcigONylqMiVDXH/g9Z9IXC2vt6O5LCKQyr41Fv3Y9vcxuKCyZOpFhlw
	FljvmI0pe2H3roSWG3J/Ieaq59FrFGewY5SuvrOu3G3MMwUfjSgRvyIrN/9fW93ce4l/ppFWHB6
	panZP94vTjtj2sL
X-Received: by 2002:a17:902:d544:b0:2d8:d4cd:dc8e with SMTP id d9443c01a7336-2db12666d73mr262145635ad.17.1788701683928;
        Sun, 06 Sep 2026 06:34:43 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db18a1eb47sm31199285ad.48.2026.09.06.06.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:34:42 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: free var refs regardless of how often they are referenced
Date: Sun,  6 Sep 2026 22:34:37 +0900
Message-ID: <20260906133437.3815209-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906125025.711111F00A3A@smtp.kernel.org>
References: <20260906124025.3550596-1-donggeunyoo.kernel@gmail.com> <20260906125025.711111F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko wrote:
> - [Medium] Memory leak of a newly created `VAR_REF` hist_field when
> `init_var_ref()` fails in `create_var_ref()`.

Confirmed, and it predates this patch.

The call that leaks was correct when 067fe038e70f ("tracing: Add variable
reference handling to hist triggers") added it, since destroy_hist_field()
freed var refs unconditionally then. It became a leak with 656fe2ba85e8
("tracing: Use hist trigger's var_ref array to destroy var_refs"), which
made destroy_hist_field() return early for HIST_FIELD_FL_VAR_REF while
create_var_ref() still reaches var_refs[] only after init_var_ref() has
succeeded.

Fix posted separately:
https://lore.kernel.org/linux-trace-kernel/20260906133352.3815019-1-donggeunyoo.kernel@gmail.com/
