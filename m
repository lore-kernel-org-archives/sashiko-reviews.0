Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680941A0B0E
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431767; cv=none; b=WRt3ZxmM7zyKDYtZvbme2E0wTsyJUw85VzQ1PvSnoHiDxfuPTDNXi4a2YkTHUzJ1XM3kf4dqMaz221Gw1pyD+oMOVtS1AvaW9z5tLf6SoZ9cLC5enb1Zst1kgUkN8sRoU4cTsV5264zgJAaJoa6jiwzuFjWG+WbDBoYxwg5mYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431767; c=relaxed/simple;
	bh=e8bAgtYfHJgAQOZuFODxHHUz0LVRi68vTtCmqYLSydo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKJ63akIPP+qtTU8wc16DD86v/DSUFT/F5HTU1/8/dushmOFMU6SzJrBxl9lLadS7ZgVujMstp8PDgWANfUAPtuOEq7mirTMIxJfY/fnJUsv9jNhBl4g4EgkB9D40nizWsoSZFbseS9ELqV/gOfnVZDjvHZxGNreMce8LnbuesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIU9M5iV; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIU9M5iV"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1645219b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431766; x=1790036566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeIop4x7wAmOz9vw9e6Ff3KbDI3nGiNHjsJHqv4/nyo=;
        b=jIU9M5iVk8sanGXW53KTe29kwkum5x9ktAGm770iqpZDRrxLbJtR/sJF0TntEWICAt
         KOdnXn4+tf3nkrnJE3F54Z0qFaBc2LtgZrSno6lEx1VfnBGVoHoGg4N1dVyBdv6kRZfG
         SSi8G3XRn+bJUy0s5P5XmiUvTyiLhU/M+xCIeCEE8K8ObnKfOAJsL84I+u8cnjxy0HH+
         0XbDD/vSk8O1X0Dyp5cMcLaMAzqMyTizDZoLW9Z3v2JV/wR3iNabUxXBJskKczeE+ig8
         8RNzq8TBM1UBrq7JO3F7bscOa6TvtRAmdRWamFhwsiYpKj1B2JJNr1nC+bF4qmeuAhnS
         yq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431766; x=1790036566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GeIop4x7wAmOz9vw9e6Ff3KbDI3nGiNHjsJHqv4/nyo=;
        b=qSoZfQdfAVikGVdmDrZx7lL1izUzyot1Qy3UX5859xoClRhLVkPglvJuamdGL6ZYme
         2RGslsUqC37NRb/qS8joXbA04WUjBa5BW/nr6j2GkNXL1lcy2okFk6euQ+CGl90fdU3H
         APh3IGuUBL6NeDcZwgrvoIgOkWrZY6yFpeVy9SS1HOrobh2WXVp7UamHkznob3N5Pey6
         gpPgUK3Yn8RbUGi0U+z0BwyiXOQQWVzue4MstxaOAJWinF++Naz1zaFxEgY+fIxuWrgE
         ipoGlJ3YNi9tJT0iN4sTQkqNW7F71JXEikSfeaFOCUsnsStWsCGfikeNDnYs5HNUu7n/
         Mw1Q==
X-Gm-Message-State: AFuF++lnISGW2cni3XzuXKHcI4tYt9psRE9GT7hk4/BJIATt8/xt/ahz
	18B3vP7b8241B+S1FqTFjFCkVgXbl9+QqvDO45VU2hd/oSZD3ElpIyQcOOiwNXk=
X-Gm-Gg: AYBFou0ffVXFT+wCCxmohn39+pE5toO2Wr+UfMDHT8svg4gZiak2JQxVdTasrOuQt3B
	3LGabqubnoMu/d/MpoUC866Uh88sWDovzXEXCa2yHj22SnOmswveI6xnshKr+9qWt/H44bcAh9L
	Ou+PGQlQfQrTDuArn80Ah2MO7kbkVeuktc3gWgqnPY6Rmu2Qzc7M3CJhoFRJM9r0w5XE9+DpjiG
	7ISEQKhkKGH8N/lVtCvds+62YC+qR/S+YwK2xKe8kFcS/C0expWFJdiB+u2rCZH+ciogdVHqLPl
	cEHbo74FUFiCsgqN50K2k/j0CZaXA0qck6r8a2FTi05atUggdleVLg3bn1FQAYY72K5w4RDStwg
	ePdGZhcFyHGO1tDQysBmjEtJDRWYXghexgUA6Zqxja9xAnJm7dNweqrlFtVd53AlTFL6eqPeCuj
	7jtcAfsAKnpmqNmsZFoDcWpXaAjcSdhodA7lSMmXpeoVf3KQsI6YDpwE+mm5Cc6kZioV+mm34FT
	DfPmBazAf6XcQg9MXTKoRaDA3s=
X-Received: by 2002:a05:6a20:9188:b0:3d3:adbf:777e with SMTP id adf61e73a8af0-3db406266e4mr10443186637.19.1789431765692;
        Mon, 14 Sep 2026 17:22:45 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:556:537c:f7cd:8a1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm28991665eec.6.2026.09.14.17.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:22:45 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>
Subject: Re: [PATCH] tracing: Unregister field variable histograms when the command fails
Date: Tue, 15 Sep 2026 09:22:39 +0900
Message-ID: <20260915002239.3685228-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914110753.221E61F000FF@smtp.kernel.org>
References: <20260914104036.1768529-1-donggeunyoo.kernel@gmail.com> <20260914110753.221E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> - [High] Error unwinding in event_hist_trigger_parse() causes Use-After-Free
>   and Double-Free of hist_data, and leaves dangling trigger_data on the
>   global named_triggers list.

This cannot happen on this base. tracing_set_clock() runs before
cmd_ops->init(), not after -- 6ede78d0563a ("tracing: Set the trace clock
before registering the histogram trigger") swapped them -- and the only code
after init() is the if (named_data) destroy block, which cannot fail. Once
hist_register_trigger() succeeds, out_free is unreachable anyway:
hist_trigger_enable() failure goes to out_unreg, which 92383cef6679 ("tracing:
Undo the registration when enabling the histogram trigger fails") made skip
the free.

> - [High] Use-after-free of the compatible hist_data when removing a target
>   histogram that uses field variables.

Real, and reproduced under KASAN. Fix sent:
https://lore.kernel.org/all/20260914234754.3676905-1-donggeunyoo.kernel@gmail.com/
