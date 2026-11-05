Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889772;
	b=rEEW5fVkLe2EsdhpdpXV1v7Xi3S3OrWrFsZpenCYUw2v7igCByhA+X9CeEOR9gYnD7V1
	 zbofXITcb/1rzpyrnoewQ5WtxMn5qAMFsgA/K7VIa7aKu/MIbC2uo6twKhFTofCEtKkqz
	 38KaGC8YXN+v4Z67a9QQjFnM0jXCM0MJUwxDTlj53mpPWX/KClrcV3nFY0HC1oNLu0lCS
	 ZB9iIjOyqN0VUO+EZ8I1oiwDADUG1HyWUGHSnJ64O0H47sF98EJsY1WqTX66EPHMmGq/I
	 wHHzYi8PkLiJ5wcd+cGgfbdRO18kP/6Llk6GjmqgyMVnU9yW5IJEIXLz50DG3yj7P9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889772;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Virus-Status:
	 X-Anti-Virus-Server;
	bh=1SRQAYjf5pmrFSOhbxfE+bbxp+C33NAKyx0Vqovaa+k=;
	b=dcbvnFq8vkNfuQekoup0SFV6/k7gXCSrmjsmMrXxqCs8stMuAwfIDQN6tQhO53uNezBb
	 UUR9svA0ozfY5I8IMUWUc7ZtcaxVNBzbn6CAxHcoYvw/+gFX7u0hBaNLsBA/P48+DXD8v
	 WI38TzXZGCeYrI15/bSrATOozI3rnYcqcMajP1jrzGSW/E0Kvn8RTWboI1VVjLGt59Bf0
	 3uP3pPJPwHy5cdAQJdbKojdiZ9irBvGIb4u5GQuAwRWIz51o5kIQNZPUYd3X/GswXR2y7
	 kC0zSQlOXAb4s9gPx3GxC8hhxV1iw1brw8/iPKDoxSEZR+mOcuKF3C73ZOe0jZVF2Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63B4606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B63B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6A5EgX84093210;
	Thu, 5 Nov 2026 23:42:33 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6A5EgXdr093205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Nov 2026 23:42:33 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <50c77aa2-acda-496a-b0f1-c48ffcf0665f@I-love.SAKURA.ne.jp>
Date: Thu, 5 Nov 2026 23:42:33 +0900
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] can: j1939: fix "struct j1939_ecu" refcount leak
 in j1939_ecu_map_locked()
To: sashiko-reviews@lists.linux.dev, linux-can@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Vincent Mailhol <mailhol@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
References: <3d7e48fa-9af5-43e2-84f7-884e61f9d179@I-love.SAKURA.ne.jp>
 <cc9950f0-a9e8-4639-b2b3-28d64f8a906b@I-love.SAKURA.ne.jp>
 <sashiko-outbox-199025@kernel.org>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <sashiko-outbox-199025@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav213.rs.sakura.ne.jp

On 2026/11/05 21:24, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Because ecu->ac_timer is not canceled during __j1939_rx_release() ->
> j1939_ecu_unmap_all(), can this cause a use-after-free if the can-j1939
> module is unloaded while ecu->ac_timer is still armed?
> 
> When an Address Claim frame is processed in j1939_ac_process(),
> j1939_ecu_timer_start() arms ecu->ac_timer for 250 ms while holding a
> reference on ecu. When the last J1939 socket is closed via
> j1939_sk_release() -> j1939_netdev_stop() -> __j1939_rx_release(),
> ecu->ac_timer remains active and holds its reference on ecu, so
> __j1939_ecu_release() is not yet called and ecu->release_work is not yet
> queued on j1939_ecu_wq:
> 
> net/can/j1939/bus.c:__j1939_ecu_release() {
> 	...
> 	INIT_WORK(&ecu->release_work, __j1939_ecu_release_work);
> 	queue_work(j1939_ecu_wq, &ecu->release_work);
> }
> 
> Neither struct j1939_ecu nor struct j1939_priv holds a module reference on
> can-j1939; only open sockets hold a reference on j1939_proto.owner. If the
> module is unloaded during the 250 ms window before ecu->ac_timer expires,
> j1939_module_exit() destroys j1939_ecu_wq immediately because no work is
> queued on it yet:
> 
> net/can/j1939/main.c:j1939_module_exit() {
> 	can_proto_unregister(&j1939_can_proto);
> 
> 	unregister_netdevice_notifier(&j1939_netdev_notifier);
> 
> 	destroy_workqueue(j1939_ecu_wq);
> }
> 
> When ecu->ac_timer fires afterward, wouldn't j1939_ecu_timer_handler()
> execute unmapped module text or queue ecu->release_work onto the destroyed
> j1939_ecu_wq?

I tried "rmmod can_j1939" while the kernel is unable to make progress due to
"kernel:unregister_netdevice: waiting for vcan0 to become free. Usage count = 11351".

The "rmmod can_j1939" operation is blocked at NETDEV_UNREGISTER event until
the vcan0's refcount drops to 1. Since j1939_ecu and j1939_priv are holding
a ref to the vcan0, module unload operation won't complete until all j1939_ecu
and j1939_priv are released. Therefore, I suspect that "[High] can: j1939:
use-after-free in j1939_ecu_timer_handler() on module exit" is a false-positive.

 INFO: task rmmod:10306 blocked for more than 122 seconds.
       Not tainted 7.3.0 #36
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 task:rmmod           state:D stack:0     pid:10306 tgid:10306 ppid:934    task_flags:0x400100 flags:0x00080000
 Call Trace:
  <TASK>
  __schedule+0x809/0x1c70
  schedule+0xb2/0x100
  schedule_preempt_disabled+0x16/0x30
  rwsem_down_write_slowpath+0x2f7/0x5f0
  down_write+0x8e/0xb0
  unregister_netdevice_notifier+0x26/0xe0
  __se_sys_delete_module+0x22d/0x350
  do_syscall_64+0x126/0x480
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
 RIP: 0033:0x7f5f867993eb
 RSP: 002b:00007ffe0ffe8318 EFLAGS: 00000202 ORIG_RAX: 00000000000000b0
 RAX: ffffffffffffffda RBX: 000055d36cfbb4b0 RCX: 00007f5f867993eb
 RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000055d36cfbb510
 RBP: 00007ffe0ffe8340 R08: 0000000000000000 R09: 0000000000000000
 R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
 R13: 000055d36cfbb4b0 R14: 00007ffe0ffe8590 R15: 0000000000000000
  </TASK>
 INFO: task rmmod:10306 <writer> blocked on an rw-semaphore likely owned by task kworker/u512:0:12 <reader>
 task:kworker/u512:0  state:D stack:0     pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00080000
 Workqueue: netns cleanup_net
 Call Trace:
  <TASK>
  __schedule+0x809/0x1c70
  schedule+0xb2/0x100
  schedule_timeout+0x100/0x180
  msleep+0x3e/0x80
  netdev_run_todo+0x36f/0x6b0
  default_device_exit_batch+0x2d7/0x330
  ops_undo_list+0x202/0x450
  cleanup_net+0x2bc/0x4b0
  process_scheduled_works+0x44d/0x7d0
  worker_thread+0x2f5/0x4a0
  kthread+0x140/0x1a0
  ret_from_fork+0x203/0x490
  ret_from_fork_asm+0x1a/0x30


