Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792217;
	b=oSr+wSrqUXf1LHpwsCFz8slTxG3cUd7woXOFPcxczJJzgB8Q5jPmdIfDLqgxJft2SeNR
	 q8/Qw5bO8NTEpWX7xkSJYWD27fzdZ/Z1Skzvb8oztlPWTc2RwODVb4CCCGEOiFSq8ZHW6
	 VeNktJ95xAIS+ZpSL69GHMKAlcatMd98J99nx+A/wz034bv+TaCvm4P7SU0OoUVJsn8Ju
	 uOGNE6AS+aCFFfGPcbZbEBKTbKRFvRUQo7/2J7sklD3iZddWqoZ+SosVYcRRdEZSQgCg+
	 lIDpJGTtiQRAkgaWwzy4BGIoVomNRBxnnPXVyFZxSfUyTZBg31wKpl0kBwGXhydcu0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
	b=sLkdLkc9pa6OtG0VKIG6sLtUxGR6/Hv+noW9ZiKq/eFgdoqohwMQcdgluq4wnOp3Blw3
	 kmQfuERQXj7Nj1uv+2zDfhr2d2tt1QkvUQZfLtuRrrLTsevX8js5BkyMAynHWuJr7tIsM
	 u1UopbNfLQqe8ubaY/QB7BxsBAZlb2JDTalnp13yCS7VSFReb2YMwPcsL37nSp8/uTT0R
	 B7shk7ctXdmwhBPp3k55CZ+u4fHDGjyqgHpLb2qaFCYzihZArE8rAmJ1h3rBwdduS8bLk
	 wXIj79xO0UA82WcYc2m+BG1sc8u0S1H0oWI8I0B4uRSgtAIT6QnjKvHHlBbjT1nh1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GSwPLlz3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E140606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E140606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GSwPLlz3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so79228265e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795792216; x=1796397016; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
        b=GSwPLlz32RpmBU3p6ZcE7kinFsNnVcFi6MpqnRc5KQiOwwKqGMQ4eTeBIp4FUdVTkq
         aSQKPSj+cC6DQviD8zCUEofXI3BtbOkB8Bu4BglKSxJeq5izspLZWNlBXGbSx5TWOp5H
         58S3QMWmlEQG15cl4k1N1wCIumP5ubtu5ldhe0MUV5S195yabXNDsmOjJpkgUyqzNJ3S
         pv35vYMQiHnaYfyrZgrf2jaY9NOux3xyejj2fdCkzt2cIw0G2nWkwesPwN7T3irptF/k
         YMF3A0uWL2Q+v/o0X0FjzCRD0QX+qE7+UIiQ4rxdGzFIsn4TGH6/wIRBC8cZdmQp8K/I
         Nw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792216; x=1796397016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dB3Mu1p4rL6bAO330MA2e6OIkjqTQSd8YGpfYYCrr/0=;
        b=tBTlB1lbKwD0fJ7BpgzptVoxOrOc0MROPH1lonZNJKuS01UX4v6+NQavDqGg7kSUq9
         U1ZruzrqDMoLDgDiAhKuxF9ISWaBQQMawozyWc3CgX/2NTIZUJjx2coAIS20Z0u6I0jt
         ktbVw/gA7byHDV0jVCk0XjCiArlmD74GSzc1LgzjHf2Njy7pCR84aEJVwIl0wR40J469
         1KsxMVg0wGm9HfBXW3J1SfQKChvi6NQ3d4yex87L6xmpLudX17GhAzVfGEqFs5piPFgn
         6ToCU7v0JhzxzGcQn2IkpzJVToQ1hfMNVgjIQtCX8KaqxS6Jo69DTmDHGlCX4E+6KjPg
         qQug==
X-Forwarded-Encrypted: i=1; AL+hErH5/8sKOgI3kC2IRRQJrDjwMU9Rw1qTAiUrMrARQst9AvMZfjoweVQGIEqsnlaKpW15LLweEup9it0svaw/kdY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/9D/h8kAkLxyZkkI4+W5F1+uEL0yqhX9bBTGZyAjnsAILNE8ri
	f0+UqutKwmRmcF/MFliH+bohAp09xndleiQEYhWeZeaRHyc0SQCVTxz927WiX0cSXLU=
X-Gm-Gg: AZFdTZfR4yZz3wHa8wCmFYOAQDhcf5R4jgRpOxstSFcOxNj459HZKzfhwafKpiH8OMb
	GJ63pk0/Mqoel7TFbNal19XDE6Tvz06TRqOOx+kN9TxiTapKLyyNeJIyaCfQemLiv8AOkg/v9kI
	lmMLVvIKvRXdL2ao6JveDux9U4hwYB9/hYJCKjE4i7fn/V0jparsJhYqDkrEdv+N+qZwqZstTVo
	9+A//G1v90GaG91zj0uiPIOj2BRZ18+UCqUJ/Xi7m+NtJKV24mAeHuP8/dgEd/bjAz2/6FdZMQ1
	tP1wNdPBWz3naooynEhrqCxAb+edDgAW+J0S1OwsrH8b5aItNXMFEuSlFmMcDuOYZ3kUmgZUvSr
	IDaYEXkMF/MozoDjyAOUPprh+TqttuANNwUjEdjM5Ngp6gl4WVBwj5MzkuWrKz/YpKM43xCwQyr
	/m1AXgG9fihJFITv7G61s550LR7Nxwto6Ei4fReQQyoUmrYbqewiiBktZQkSe7kMA1PDdKts3Yl
	DGT49jq013fkF70vIPamqUloNv2OlA9RbXGA2Y0hEGmYFMDekh+HPONRdB+d059mthN1OYfJhpO
	09fGeKAo5KRIdDsubrRaj8j/CL5YTIpin1909JS3liU6a7Pq6hxO
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr493578005e9.35.1795792215604;
        Fri, 27 Nov 2026 07:10:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm729529545e9.8.2026.11.27.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:10:15 -0800 (PST)
Date: Fri, 27 Nov 2026 16:10:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: "Ravindran, Binoy" <binoy@vt.edu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
	"Shastri, Jaidev" <jaidevshastri@vt.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] livepatch: Include exiting tasks in the transition
Message-ID: <awmdVLfnwgrS9VfS@pathway.suse.cz>
References: <20261125-klp-series-v3-v3-0-b1e0f79af331@vt.edu>
 <20261125-klp-series-v3-v3-2-b1e0f79af331@vt.edu>
 <sashiko-outbox-234405@kernel.org>
 <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
 <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>
 <awmWExtIJGM805__@pathway.suse.cz>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awmWExtIJGM805__@pathway.suse.cz>

On Fri 2026-11-27 15:39:15, Petr Mladek wrote:
> On Thu 2026-11-26 11:12:27, Yafang Shao wrote:
> > On Thu, Nov 26, 2026 at 8:58 AM Ravindran, Binoy <binoy@vt.edu> wrote:
> > >
> > >
> > > Thanks, this is right. A dying task reports its quiescent state in
> > > rcu_note_context_switch(), early in __schedule(), and then still runs
> > > traceable code, such as update_rq_clock() and pick_next_task(), until
> > > switch_to(). RCU does not promise to wait for code after that point, and
> > > with expedited grace periods the quiescent state is reported right
> > > there, so synchronize_rcu() can return too early.
> > > klp_synchronize_transition(), which v2 used, does not have this
> > > problem: schedule_on_each_cpu() completes only after the work item has
> > > run on every CPU, which on the dying task's CPU happens only after
> > > switch_to().
> > >
> > > v4 goes back to klp_synchronize_transition() for both waits and keeps
> > > klp_try_switch_exiting_tasks() from v3. I will send it after rerunning
> > > the tests.
> > >
> > > Yafang, this reverses your second suggestion; I hope the reason above
> > > makes sense. It also brings back the v2 transition times.
> > 
> > Agreed. I missed the point that the quiescent state is reported early
> > in __schedule(), and that the code from there until switch_to() is not
> > covered by synchronize_rcu(). Thanks for pointing that out.
> 
> Honestly, I think that synchronize_srcu() should work. Otherwise,
> the comment in rcu_tasks_postgp() would be wrong.
> 
> IMHO, the trick is that there are two interlacing rcu_read() periods
> in do_exit() and synchronize_rcu(), see the comment in
> rcu_tasks_postscan() and the commit e4e1e8089c5fd9 ("rcu-tasks:
> Improve comments explaining tasks_rcu_exit_srcu purpose").

Wait! I might be wrong. I think that it does not work because
the 1st rcu_read section ends in exit_rcu() which is called
before exit_tasks_rcu_finish() where the task is removed
from rcu_tasks_exit_list.

By other words, the task is removed from the rcu_tasks_exit_list
in the later 2nd RCU period. So, if synchronize_rcu() is going
to wait for this 2nd period then it might end prematurely because
the quiescent state is reported by rcu_note_context_switch()
early in __schedule().

But I might miss something. I am not sure which period
synchronize_rcu() is waiting for.

Best Regards,
Petr
