Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790360;
	b=N7f2inZPltLjW11G7EhfmUvo+D3STJT3MZvanHM6SKSsitVczLhA8v7NAAYWw9t3Smsv
	 WAKejIf+YKNgg+IkSJ6m98VwCp+z8C2s8XPvK9GDAEakPr4yTay/6qiIQwyHEGRbc/CT0
	 NOmmh7PTxTBW1rbhy1eFMDkMEUVbtrBdknOV5A55ilPKPkHr4PI9AsaIOQHJ9inhxNTxl
	 UzwjZFwWBLSSrVshtK+CSKvTYWBWuS0km6ppuAjOVomy9E4RuCbTKxrTfmUslKam9hnsq
	 8Gxu0eRCeX5jaHMmM5V5nkxM4U7peytAfpGADysykoSyrc6eNmxMxBFP4mYamh3QD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6/DHKlXFhMo0Z9b6H9IFVOO6KYXjJkCSJrFRpsaTfpo=;
	b=z9W4pCZpIUkY9W5QIzOY/HmZaJIuuGKFlJFDJQ9KHPAs+RSLGQ3Yb2KKsO3Inuw4GdIw
	 Kdq9AvPWfMqFZOnphbG+tL+YUSWJXdb2PUy23EpW77p8iFunnITX9hBmCsf3yPPhPngFw
	 lyMGoBuUZIFhJv7MJdyWCYURpO/jl3b73Rof5GoE1VRjVO1h7xyvKQOBaZ4XAbJtHlCIm
	 C4Mv4/KKG2/MBLpldgRFzKRrEmdt7MaXNUEUqC2axWCF4InH6EZcuNm0r3ryt34jrL2NK
	 mJ35rEp+qCWQC6zU/wpX0hscRbl7hr5is3x0z4e89UK1QAbbncv5XnqDfmdv8DaA6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dvYSmpR1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF0A606A858
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 14:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF0A606A858
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dvYSmpR1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so86971345e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795790358; x=1796395158; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/DHKlXFhMo0Z9b6H9IFVOO6KYXjJkCSJrFRpsaTfpo=;
        b=dvYSmpR1Ns/2OkFmjN38dSXS2qaFP95wa+n5vhBZrpmTs/ZzgsfzpQDchuVA2eIWnY
         NCNKLCv1kklW3ni56YN0/WWufY3D0d1DHMDfS/xeEgeKNoPg7blWS93TqX14aCp+vN0h
         8XOUph8rG0SH9wpGgJuY5dHO97TQRntyTsRU6cLEJ9u/Kz9Bl9tDlYEoICURkS8kJLIU
         w5Qp7KnMH4EgQaECs8Jk8isKJGci9G6ne4fSKFeHRGs1H5AjlHBL2tHTuGgs7tIMTcQw
         UMr4wQRL322lgp3ulMXWTYULIQdVeWLXVz0ODNqAxX6OA+LocQygrl1GYELcUSzy1dek
         aeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790358; x=1796395158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6/DHKlXFhMo0Z9b6H9IFVOO6KYXjJkCSJrFRpsaTfpo=;
        b=mO0H7Fr73QV81arhYcnZVdPV1oz0pVUYd43gm9KDQ0sNr3YiciZXmg9evV+UjO6fno
         NmkDSUNtzxG3jgluBghqSyylddsUQb4SweQC3QozLywCmYu4gijB6HwrY3S9NNkva1ag
         gf011GnlwRURftpOOTwEgOOzUmrLJNHelOFhxE1uiilF+l8dWHghFj8oSutmS72kxDyv
         7hsHumoPvv9cRv43TdW9Fa7Z0H7/0wDWCRvgA2KDWI66LXcU7vAkCBFRa7ATXIXpxAvY
         MwLRFoj9ja3dUFCyAaXe8vVscHqCN79Fw1SwRXcnUP/llCExoVeoNGQKPi2mgkobBfCi
         hkcQ==
X-Forwarded-Encrypted: i=1; AL+hErGMMnsXbdMSmgwhdDgey3eYnEnPu43VnD8WDO1eAPuhjr8ggoqFVJ0DB23y3RcEAg1p4uyI/OtP+DIpwSALo6A=@lists.linux.dev
X-Gm-Message-State: APuU4Z+n5i7D6DVkAwoKCEyeCaI8re9q8J+sRo8WcAjbJnoqKQtBRIij
	/7YwgHFJ7Pq2x91YMhqDPaVfMJCPk4ta+8SsfFpJF08jtCqusJ8B36BrbFNWKgroMxk=
X-Gm-Gg: AZFdTZcU7QCCkJewdZ++Kk2HFXr1wo3uvY/BlpBGqDk2CPls1Vwme1BSW4hT637vu5C
	QfdFfG55jTyRXQzpreaUtqasYhm9J44HlYeok0zLLbbS2zi/XKl9khkA1rEjviWjR9Ouk5t/8uZ
	jThd75RqGV5HTr9u1VebnZ4PInQlnBsYcc1gBHd/7VJuzZoqPuxRDdLHB9Ygiu47QEkEqVF7KW4
	62lxoiawMUY1jb0l4BiBWVMY1FSf5L1xZVr9R9uXrmbcoo+2wN0qJT3zQN+ahGWC1zvAY4x+4KK
	4RvEdSg520fov8b4qtgEoMfuzB1lDOcdXUzfb1BIbgWLh2hYVwGsHQ1cSKqGeupYe309bY0P6bF
	xs/kQTo6RjbPvn2BdufFhpKQfZ9Bp+sBKnzT/Rx8WoErgBKJV9qp/mJzw/+JRWthVwec6YEHc/t
	qpwDmU2scwpBwnf7LzjuA6M8uk7bYSeMBCQ+AQrYGyFrJBpX0kUvOe3K6MWIexEqTdRvQfVHytu
	GRkY6ka5Ukhk21ZVoVxmW/G8Y4TQRCS5yKXOEMduM+l6QCl/FyBM4ArJbJD9leCeFb3BZpZe2Yk
	ig+0ezYuc+Tdyldis+MZNN7YHezmdbI=
X-Received: by 2002:a05:600c:4584:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb887e266amr484172275e9.1.1795790358486;
        Fri, 27 Nov 2026 06:39:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbb97e5356sm7164615e9.4.2026.11.27.06.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:39:18 -0800 (PST)
Date: Fri, 27 Nov 2026 15:39:15 +0100
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
Message-ID: <awmWExtIJGM805__@pathway.suse.cz>
References: <20261125-klp-series-v3-v3-0-b1e0f79af331@vt.edu>
 <20261125-klp-series-v3-v3-2-b1e0f79af331@vt.edu>
 <sashiko-outbox-234405@kernel.org>
 <DM6PR05MB4137C0B5BB4D88A9D5847EBAD1432@DM6PR05MB4137.namprd05.prod.outlook.com>
 <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>
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
In-Reply-To: <CALOAHbAQuYG__4b054bRobVRyT+v143wBcVAN26T_PtiO-oqmA@mail.gmail.com>

On Thu 2026-11-26 11:12:27, Yafang Shao wrote:
> On Thu, Nov 26, 2026 at 8:58 AM Ravindran, Binoy <binoy@vt.edu> wrote:
> >
> >
> > Thanks, this is right. A dying task reports its quiescent state in
> > rcu_note_context_switch(), early in __schedule(), and then still runs
> > traceable code, such as update_rq_clock() and pick_next_task(), until
> > switch_to(). RCU does not promise to wait for code after that point, and
> > with expedited grace periods the quiescent state is reported right
> > there, so synchronize_rcu() can return too early.
> > klp_synchronize_transition(), which v2 used, does not have this
> > problem: schedule_on_each_cpu() completes only after the work item has
> > run on every CPU, which on the dying task's CPU happens only after
> > switch_to().
> >
> > v4 goes back to klp_synchronize_transition() for both waits and keeps
> > klp_try_switch_exiting_tasks() from v3. I will send it after rerunning
> > the tests.
> >
> > Yafang, this reverses your second suggestion; I hope the reason above
> > makes sense. It also brings back the v2 transition times.
> 
> Agreed. I missed the point that the quiescent state is reported early
> in __schedule(), and that the code from there until switch_to() is not
> covered by synchronize_rcu(). Thanks for pointing that out.

Honestly, I think that synchronize_srcu() should work. Otherwise,
the comment in rcu_tasks_postgp() would be wrong.

IMHO, the trick is that there are two interlacing rcu_read() periods
in do_exit() and synchronize_rcu(), see the comment in
rcu_tasks_postscan() and the commit e4e1e8089c5fd9 ("rcu-tasks:
Improve comments explaining tasks_rcu_exit_srcu purpose").

Best Regards,
Petr
