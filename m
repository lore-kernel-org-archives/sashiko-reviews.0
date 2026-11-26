Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662785;
	b=RL70JsXvt4NkVqmAgKfSprVz/OMKP06LILEpJe1pteM0RWsmL2AYZJtD9SmP4FXiXu+n
	 hFFMaJKbbbawh+/qDYLwLoKejICuKv05Z8yb7QGb2z4fm4W6iKxkv9l22LfxbWAq4HUUA
	 3fh8cf2fw7VkUcE7PSQK7EcX8jszb8Ob0ta6u1d4BufFtFLhgJTFsoZVfNOO0axH9OHNs
	 wNyd7TEcHKIDyd8gpv/8XVVpXJAUiaO2Z01PyemE2pUPp3DpRH+wAFwx8ZRaylxnsylvd
	 5ZaO3uWDNn3c1bRMkj/6CrXN8sGIwiTH8e5QMmyYVLGpnp3eRWmNwJJUo+dZDINBApA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
	b=LF6Uby+XswJXb2RqpYCxnT8x2ZuX/ZCjnJk54IYVNYC/UFtqm5crEdsB3aAfvIG+J9o8
	 rLpoyhXPZwJeEI+BFnQXt3HO+TaFlVTpe27oW9mGuu5AZUGjIO5hdQIEVI6ll4uWcTkyJ
	 35/SVm4CdzmVbFxl3K3tdtUlITrIFgFcWjTzTykxqgvsKIGB+gkvoSTVXjpfVrS9bmsMc
	 rdbDA6gDe5rGAttHoeBJSHK106PGUjqPyJGaoLml549L1O7CMqa3CbTlE8F5SYo6ZEZcc
	 liSPwxhEKulZufMz6hdBiT9ojF4F8WlLkZrG6o89I1z7JTIHEIQr6jDNkNACDANyyKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXu5o35a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2B606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 03:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXu5o35a
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4fb5d96b3so101387737b3.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 19:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795662784; cv=none;
        d=google.com; s=arc-20260327;
        b=PROHlp+uffHmBZVnNe1Gtk7A7o+iur3s/LovTJv90p8AhxpzYow+TancVN+q8Na9v2
         StI0V9Y+8nu8BsDxEjgozqlxjrwX76qOw6nRcMBzmY7woU19+36fsRaE0EH6KMqsdwRW
         UtAw6mQXTJUQyzalXXwUncl2wQWS8RofCfcMxYlhM8KKJjS3ohI0xJp4Fnwg014V44L8
         Iv5cf7sCrwxSDhtJNZBjz9gvpJHjhGJqYGnQqU8WamqEJtZ062eHMNQ9B40jfV1/mnJw
         tV6XDyh+MuoXRmFX7tS4+QqPusWiM/9qk2OiNlaaZ/8RK+Cr/dJ4fd7ClD3NEXI3G7rI
         LtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        fh=9VcpeNusHCTiWtgyr/As4WZF95cNBZ5GayoBakNmij4=;
        b=fv6Uha7l9ZX9Amg4Jnay4Zb4SisGCWiTNVJ1uw6TMTpxprR5ViRbeyqKA9sIx5fLhS
         W6R3dpL8z+iXywn22i4exfMpq23xqMR4CJM3LYfqnkJe/3QzGHYN+v5192TRiyz+lnn2
         X6p1VO/jBGW/4jxFRHhmqGiSihn4Z1+o3sZi/Af6+GPcNau2szF5/6smNsCXxoR6Rkbq
         WdyCduxeMXHzxZDzUrtWvv0FXMjkLsw0LELykEpllBd4bEUmZweRk4CgfFHcLiMRTpun
         Esw1P+JPY6R+OzO8RRBJU2I1TllmRbfRUSzZ7nmMCBCp0xn8eyTsL1lllNYb33+gCaOp
         S8Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662784; x=1796267584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        b=MXu5o35a1vOEzAtZuY6OXo+yhaOFFlUfzlRC2Gfc+xFzLS19Ews5P9lvp+ZLbCdouC
         O2hdl4lhtSJSDDfrx8iKW2elwzL2HdZd3XbbGbQm1GNJJ9M4adLRDjNfcmQwusFg+q9o
         uKPXLl4P9n3NBcq4Ok+UMo72KDezGtfokuoGh4w/YW5z/MTMa+t3CBta8jccALcarJ6O
         IdXJueSfeXFmGfFXWSBSAbzYQQ7g281oEsaVX+edtKJzcUa9ZHuCfTH4B/O3pqFMfszA
         aX5ztYBE62d4qGahpITv+SyLkZzPGwbEJXKl/t+Lovdek2+WmRbqesYJez2zl2HxeuBV
         Y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662784; x=1796267584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0u2teU5+DNhXHRl/MB1LD7h44EF6lJ6g1dkNyrP5OEA=;
        b=GV6JyzdDxDI1P2zQDtWxFUo4ERJdOdRBqwTvlu5ZXHscvDaRcGzdTzlMJH8qheczuw
         g5nu3AD4QIP5xLFdoU5iJVijrGLt6SjEfEy0L2JJsX5D/Tyoxgpx6RDILjYzJBOUIFzQ
         OgcfYRZzRSXNszoGrLQSGNIVcts/144X0Wv2VL5zODu+87jYbwO6WJoVGb3EqGtqajzF
         CF5pZqHd97XIvDgfNI5GgATxfGOSa6XABRSHW939vb4UG6x5ovavzIXAWgVgPg09k4Ks
         Eq9FCUSxL3l+3f3rCXZg8E1YnXtg+O7XpiSEnA4XEOKE//1STutRAta4jF9abAi4JhJo
         jpyA==
X-Forwarded-Encrypted: i=1; AL+hErGNTU4KL7cFRyJZ1XfGSaremggU2WJMl+2XDNVoaO2s+9pk2CTHkB8svhEBNLF2opkh5DrxyMfkkliufUj6Jv0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/JG8+kTXwhKILhcbpV4wLI7Iq8Vx65b+B1AVScs+VD662wL4DJ
	Q8GxHZbE4JZCsr8ycfyXt7f1sgTjaYw+xUDtkelqLapIjoDjUz6FTAQKFurNli0NqF/3TSUM7lp
	t+5dTt7vt0kV80GCyX+Tf+bNbIB4kLmsurLbp
X-Gm-Gg: AZFdTZcglPHFv1/9M9Q+wSuUVXwPUMehAee2QDRjiyNfmpNM74TTcROVONwDsj74uu3
	9m/tT/NLnZKVt2iYQxlMIugTsSpRk31okLUxqk3y17H6andh4Oy7yKRnKAGPd5qupF6wpezX3nJ
	r6hY01eosjc7WEwkYvyG5yyYpgKJoJEhlC96SdbTQ0yU/PIZZzQwjY54Zf6e87ORsK+BtNOZf3+
	q+SHqFDdbmZaL1tj9y+R+au14e6BzRG/crbd0FGCb5fy8ZRsuiLY5rEurOZ5rFO0ih/2vSZ8TWu
	PExkXYStQSq+heXDXafXdxO6RNP7cfplT8/tJi3iYaAtrczQb9lpKGVNXMq30i3Xsi1AlewgbN5
	eb/EkVtiOCB2yran1R+nmwm/oPtdg1QnBMkofK+JBQlhfZYx4zxEu3xEr0vEttnAYTBU=
X-Received: by 2002:a05:690c:6d83:b0:8b1:6c4d:6b83 with SMTP id
 00721157ae682-8b518f1cf54mr82200347b3.24.1795662783714; Wed, 25 Nov 2026
 19:13:03 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-klp-series-v3-v3-0-b1e0f79af331@vt.edu>
 <20261125-klp-series-v3-v3-2-b1e0f79af331@vt.edu> <sashiko-outbox-234405@kernel.org>
 <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
In-Reply-To: <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 26 Nov 2026 11:12:27 +0800
X-Gm-Features: Aa3M54r9bQyCNEtl8vDg0fA8BgkRlMLeLZFLbV6lOjC0bsXV0kG9vz91uifhxJo
Message-ID: <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] livepatch: Include exiting tasks in the transition
To: "Ravindran, Binoy" <binoy@vt.edu>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "Shastri, Jaidev" <jaidevshastri@vt.edu>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:58=E2=80=AFAM Ravindran, Binoy <binoy@vt.edu> wro=
te:
>
>
> Thanks, this is right. A dying task reports its quiescent state in
> rcu_note_context_switch(), early in __schedule(), and then still runs
> traceable code, such as update_rq_clock() and pick_next_task(), until
> switch_to(). RCU does not promise to wait for code after that point, and
> with expedited grace periods the quiescent state is reported right
> there, so synchronize_rcu() can return too early.
> klp_synchronize_transition(), which v2 used, does not have this
> problem: schedule_on_each_cpu() completes only after the work item has
> run on every CPU, which on the dying task's CPU happens only after
> switch_to().
>
> v4 goes back to klp_synchronize_transition() for both waits and keeps
> klp_try_switch_exiting_tasks() from v3. I will send it after rerunning
> the tests.
>
> Yafang, this reverses your second suggestion; I hope the reason above
> makes sense. It also brings back the v2 transition times.

Agreed. I missed the point that the quiescent state is reported early
in __schedule(), and that the code from there until switch_to() is not
covered by synchronize_rcu(). Thanks for pointing that out.

--=20
Regards
Yafang
